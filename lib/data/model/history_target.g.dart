// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_target.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryTargetAdapter extends TypeAdapter<HistoryTarget> {
  @override
  final int typeId = 3;

  @override
  HistoryTarget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryTarget(
      id: fields[0] as int,
      nameTarget: fields[1] as String,
      nominal: fields[2] as int,
      description: fields[3] as String,
      createdAt: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryTarget obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameTarget)
      ..writeByte(2)
      ..write(obj.nominal)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryTargetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
