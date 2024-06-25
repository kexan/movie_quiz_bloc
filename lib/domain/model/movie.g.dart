// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      kinopoiskId: fields[0] as int,
      ratingKinopoisk: fields[1] as double,
      posterUrlPreview: fields[2] as String,
      nameRu: fields[3] as String?,
      year: fields[4] as int?,
      description: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.kinopoiskId)
      ..writeByte(1)
      ..write(obj.ratingKinopoisk)
      ..writeByte(2)
      ..write(obj.posterUrlPreview)
      ..writeByte(3)
      ..write(obj.nameRu)
      ..writeByte(4)
      ..write(obj.year)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
