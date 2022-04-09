import 'package:hive/hive.dart';
import 'package:mobileraker/domain/machine.dart';
import 'package:mobileraker/repository/printer_setting_repository.dart';

class PrinterSettingHiveRepository implements PrinterSettingRepository {
  late final _boxPrinterSettings = Hive.box<Machine>('printers');


  Future<void> insert(Machine printerSetting) async {
    await _boxPrinterSettings.put(printerSetting.uuid, printerSetting);
    return;
  }


  Future<void> update(Machine printerSetting) async {
    await printerSetting.save();

    return;
  }

  Future<Machine?> get({String? uuid, int index=-1}) async {
    assert(uuid != null || index >= 0, 'Either provide an uuid or an index >= 0');
    if (uuid != null)
      return _boxPrinterSettings.get(uuid);
    else
      return _boxPrinterSettings.getAt(index);
  }

  Future<Machine> remove(String uuid) async {
    Machine? printerSetting = await get(uuid: uuid);

    printerSetting?.delete();
    return printerSetting!;
  }

  Future<List<Machine>> fetchAll() {
    return Future.value(_boxPrinterSettings.values.toList(growable: false));
  }

  Future<int> count() {
    return Future.value(_boxPrinterSettings.length);
  }
}
