// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_wallet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryWalletAdapter extends TypeAdapter<HistoryWallet> {
  @override
  final int typeId = 4;

  @override
  HistoryWallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryWallet(
      id: fields[0] as int,
      nameWallet: fields[1] as String,
      nominal: fields[2] as int,
      description: fields[3] as String,
      cashIn: fields[4] as bool,
      createdAt: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryWallet obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameWallet)
      ..writeByte(2)
      ..write(obj.nominal)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.cashIn)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryWalletAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
