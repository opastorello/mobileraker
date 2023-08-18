/*
 * Copyright (c) 2023. Patrick Schmidt.
 * All rights reserved.
 */

part of 'machine.dart';

//TODO: Remove after a couple of months and migrate back to autogenerated adapter!
class MachineAdapter extends TypeAdapter<Machine> {
  @override
  final int typeId = 1;

  @override
  Machine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    Uri wsUri;
    if (fields[1] is String?) {
      wsUri = buildMoonrakerWebSocketUri(fields[1] as String, false) ??
          Uri.parse('ws://127.0.0.1/websocket');
      logger.w(
          'Found a legacy Printer wsUri for ${fields[0]}(${fields[2]}). "${fields[1]}" migrated to "$wsUri"');
    } else {
      wsUri = fields[1] as Uri;
    }

    Uri httpUri;
    if (fields[6] is String?) {
      httpUri = buildMoonrakerHttpUri(fields[6] as String) ?? Uri.parse('http://127.0.0.1');

      logger.w(
          'Found a legacy Printer httpUri for ${fields[0]}(${fields[2]}). "${fields[6]}" migrated to "$httpUri"');
    } else {
      httpUri = fields[6] as Uri;
    }

    return Machine(
      name: fields[0] as String,
      wsUri: wsUri,
      httpUri: httpUri,
      apiKey: fields[4] as String?,
      temperaturePresets: fields[5] == null ? [] : (fields[5] as List).cast<TemperaturePreset>(),
      trustUntrustedCertificate: fields[19] == null ? false : fields[19] as bool,
      octoEverywhere: fields[20] as OctoEverywhere?,
      camOrdering: fields[21] == null ? [] : (fields[21] as List).cast<String>(),
      httpHeaders: fields[22] == null ? {} : (fields[22] as Map).cast<String, String>(),
      timeout: fields[23] == null ? 3 : fields[23] as int,
    )
      ..uuid = fields[2] as String
      ..lastPrintProgress = fields[14] == null ? 0 : fields[14] as double?
      .._lastPrintState = fields[15] as String?
      ..fcmIdentifier = fields[17] as String?
      ..lastModified = fields[18] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, Machine obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.wsUri)
      ..writeByte(6)
      ..write(obj.httpUri)
      ..writeByte(2)
      ..write(obj.uuid)
      ..writeByte(4)
      ..write(obj.apiKey)
      ..writeByte(22)
      ..write(obj.httpHeaders)
      ..writeByte(23)
      ..write(obj.timeout)
      ..writeByte(5)
      ..write(obj.temperaturePresets)
      ..writeByte(14)
      ..write(obj.lastPrintProgress)
      ..writeByte(15)
      ..write(obj._lastPrintState)
      ..writeByte(17)
      ..write(obj.fcmIdentifier)
      ..writeByte(18)
      ..write(obj.lastModified)
      ..writeByte(19)
      ..write(obj.trustUntrustedCertificate)
      ..writeByte(20)
      ..write(obj.octoEverywhere)
      ..writeByte(21)
      ..write(obj.camOrdering);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachineAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
