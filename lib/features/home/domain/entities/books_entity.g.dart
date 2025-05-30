// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksEntityAdapter extends TypeAdapter<BooksEntity> {
  @override
  final int typeId = 0;

  @override
  BooksEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BooksEntity(
      previewLink: fields[4] as String,
      author: fields[0] as String,
      title: fields[1] as String,
      image: fields[2] as String,
      ratting: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BooksEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.ratting)
      ..writeByte(4)
      ..write(obj.previewLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
