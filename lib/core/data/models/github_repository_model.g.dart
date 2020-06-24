// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GitHubRepositoryModelAdapter extends TypeAdapter<GitHubRepositoryModel> {
  @override
  final typeId = 0;

  @override
  GitHubRepositoryModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GitHubRepositoryModel(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      url: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GitHubRepositoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url);
  }
}
