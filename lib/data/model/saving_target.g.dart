// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_target.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavingTargetAdapter extends TypeAdapter<SavingTarget> {
  @override
  final int typeId = 1;

  @override
  SavingTarget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavingTarget(
      id: fields[0] as int?,
      nameTarget: fields[1] as String,
      nominal: fields[2] as int,
      period: fields[3] as int,
      durationType: fields[4] as String,
      currentMoney: fields[5] as int,
      category: fields[6] as Category,
      priority: fields[7] as String,
      decription: fields[8] as String,
      createdAt: fields[9] as int,
      foreign: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavingTarget obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameTarget)
      ..writeByte(2)
      ..write(obj.nominal)
      ..writeByte(3)
      ..write(obj.period)
      ..writeByte(4)
      ..write(obj.durationType)
      ..writeByte(5)
      ..write(obj.currentMoney)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.priority)
      ..writeByte(8)
      ..write(obj.decription)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.foreign);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavingTargetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
