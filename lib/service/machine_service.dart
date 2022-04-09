import 'dart:async';

import 'package:hive/hive.dart';
import 'package:mobileraker/app/app_setup.locator.dart';
import 'package:mobileraker/app/app_setup.logger.dart';
import 'package:mobileraker/domain/gcode_macro.dart';
import 'package:mobileraker/domain/macro_group.dart';
import 'package:mobileraker/domain/machine.dart';
import 'package:mobileraker/repository/printer_setting_hive_repository.dart';
import 'package:mobileraker/service/moonraker/database_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

/// Service handling the management of multiple machines/printers/klipper-enabled devices
class MachineService {
  MachineService() {
    selectedMachine = BehaviorSubject<Machine?>();
    String? selectedUUID = _boxUuid.get('selectedPrinter');
    if (selectedUUID != null)
      _printerSettingRepo.get(uuid: selectedUUID).then((value) {
        if (value != null) setMachineActive(value);
      });
  }
  late final _boxUuid = Hive.box<String>('uuidbox');
  late final BehaviorSubject<Machine?> selectedMachine;

  final _logger = getLogger('MachineService');
  final _printerSettingRepo = locator<PrinterSettingHiveRepository>();


  Stream<BoxEvent> get printerSettingEventStream =>
      Hive.box<Machine>('printers').watch();



  Future<void> updateMachine(Machine printerSetting) async {
    await printerSetting.save();
    if (!selectedMachine.isClosed && isSelectedMachine(printerSetting))
      selectedMachine.add(printerSetting);

    return;
  }

  Future<Machine> addMachine(Machine printerSetting) async {
    await _printerSettingRepo.insert(printerSetting);
    await setMachineActive(printerSetting);
    return printerSetting;
  }

  Future<void> removeMachine(Machine printerSetting) async {
    _logger.i("Removing machine ${printerSetting.uuid}");
    await _printerSettingRepo.remove(printerSetting.uuid);
    if (selectedMachine.valueOrNull == printerSetting) {
      _logger.i("Machine ${printerSetting.uuid} is active machine");
      List<Machine> remainingPrinters =
          await _printerSettingRepo.fetchAll();

      Machine? nextMachine =
          remainingPrinters.length > 0 ? remainingPrinters.first : null;

      await setMachineActive(nextMachine);
    }
  }

  Future<List<Machine>> fetchAll() {
    return _printerSettingRepo.fetchAll();
  }

  Future<int> count() {
    return _printerSettingRepo.count();
  }

  setMachineActive(Machine? printerSetting) async {
    if (printerSetting == null) {
      // This case sets no printer as active!
      await _boxUuid.delete('selectedPrinter');
      if (!selectedMachine.isClosed) selectedMachine.add(null);

      _logger.i(
          "Selecting no printer as active Printer. Stream is closed?: ${selectedMachine.isClosed}");
      return;
    }

    if (printerSetting == selectedMachine.valueOrNull) return;

    await _boxUuid.put('selectedPrinter', printerSetting.key);
    if (!selectedMachine.isClosed) selectedMachine.add(printerSetting);
  }

  selectNextMachine() async {
    List<Machine> list = await fetchAll();

    if (list.length < 2) return;
    _logger.i('Selecting next machine');
    int indexSelected = list.indexWhere(
        (element) => element.uuid == selectedMachine.valueOrNull?.uuid);
    int next = (indexSelected + 1) % list.length;
    setMachineActive(list[next]);
  }

  selectPreviousMachine() async {
    List<Machine> list = await fetchAll();
    if (list.length < 2) return;
    _logger.i('Selecting previous machine');
    int indexSelected = list.indexWhere(
        (element) => element.uuid == selectedMachine.valueOrNull?.uuid);
    int prev = (indexSelected - 1 < 0) ? list.length - 1 : indexSelected - 1;
    setMachineActive(list[prev]);
  }

  bool machineAvailable() {
    return selectedMachine.valueOrNull != null;
  }

  bool isSelectedMachine(Machine toCheck) =>
      toCheck == selectedMachine.valueOrNull;

  /// The FCM-Identifier is used by the python companion to
  /// identify the printer that sends a notification in case
  /// a user configured multiple printers in the app.
  /// Because of that the FCMIdentifier should be set only once!
  Future<String> fetchOrCreateFcmIdentifier(
      Machine printerSetting) async {
    DatabaseService databaseService = printerSetting.databaseService;
    String? item =
        await databaseService.getDatabaseItem('mobileraker', 'printerId');
    if (item == null) {
      String nId = Uuid().v4();
      item = await databaseService.addDatabaseItem(
          'mobileraker', 'printerId', nId);
      _logger.i("Registered fcm-PrinterId in MoonrakerDB: $nId");
    } else {
      _logger.i("Got FCM-PrinterID from MoonrakerDB to set in Settings:$item");
    }

    if (item != printerSetting.fcmIdentifier) {
      printerSetting.fcmIdentifier = item;
      await printerSetting.save();
      _logger.i("Updated FCM-PrinterID in settings $item");
    }
    return item!;
  }

  Future<void> registerFCMTokenOnMachineNEW(
      Machine printerSetting, String fcmToken) async {
    DatabaseService databaseService = printerSetting.databaseService;
    Map<String, dynamic>? item =
        await databaseService.getDatabaseItem('mobileraker', 'fcm.$fcmToken');
    if (item == null) {
      item = {'printerName': printerSetting.name};
      item = await databaseService.addDatabaseItem(
          'mobileraker', 'fcm.$fcmToken', item);
      _logger.i("Registered FCM Token in MoonrakerDB: $item");
    } else if (item['printerName'] != printerSetting.name) {
      item['printerName'] = printerSetting.name;
      item = await databaseService.addDatabaseItem(
          'mobileraker', 'fcm.$fcmToken', item);
      _logger.i("Updated Printer's name in MoonrakerDB: $item");
    }
    _logger.i("Got FCM data from MoonrakerDB: $item");
  }

  Future<void> registerFCMTokenOnMachine(
      Machine printerSetting, String fcmToken) async {
    DatabaseService databaseService = printerSetting.databaseService;

    var item =
        await databaseService.getDatabaseItem('mobileraker', 'fcmTokens');
    if (item == null) {
      _logger.i("Creating fcmTokens in moonraker-Database");
      await databaseService
          .addDatabaseItem('mobileraker', 'fcmTokens', [fcmToken]);
    } else {
      List<String> fcmTokens = List.from(item);
      if (!fcmTokens.contains(fcmToken)) {
        _logger.i("Adding token to existing fcmTokens in moonraker-Database");
        await databaseService.addDatabaseItem(
            'mobileraker', 'fcmTokens', fcmTokens..add(fcmToken));
      }
    }
  }

  Future<Machine?> machineFromFcmIdentifier(String fcmIdentifier) async {
    List<Machine> machines = await fetchAll();
    for (Machine element in machines)
      if (element.fcmIdentifier == fcmIdentifier) return element;
    return null;
  }

  Future<int> indexOfMachine(Machine setting) async {
    int i = -1;
    List<Machine> machines = await fetchAll();
    for (Machine element in machines) {
      i++;
      if (element == setting) return i;
    }
    return i;
  }

  updateSettingMacros(Machine printerSetting, List<String> macros) {
    _logger.i("Updating Default Macros!");
    List<String> filteredMacros =
        macros.where((element) => !element.startsWith('_')).toList();
    List<MacroGroup> macroGroups = printerSetting.macroGroups;
    for (MacroGroup grp in macroGroups) {
      for (GCodeMacro macro in grp.macros) {
        filteredMacros.remove(macro.name);
      }
    }

    MacroGroup defaultGroup = macroGroups
        .firstWhere((element) => element.name == 'Default', orElse: () {
      MacroGroup group = MacroGroup(name: 'Default');
      macroGroups.add(group);
      return group;
    });

    defaultGroup.macros.addAll(filteredMacros.map((e) => GCodeMacro(e)));
  }

  dispose() {
    selectedMachine.close();

    fetchAll().then((machines) {
      for (Machine machine in machines) {
        machine.disposeServices();
      }
    });
  }
}
