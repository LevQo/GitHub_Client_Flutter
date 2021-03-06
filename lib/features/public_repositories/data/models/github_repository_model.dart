import 'package:flutter/cupertino.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:hive/hive.dart';

part 'github_repository_model.g.dart';

@HiveType(typeId: 0)
class GitHubRepositoryModel extends HiveObject implements GitHubRepositoryEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String owner;

  GitHubRepositoryModel({this.id, this.name, this.description, this.url, this.owner});

  factory GitHubRepositoryModel.fromJson(Map<String, dynamic> json) {
    return GitHubRepositoryModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        url: json['url'],
        owner: json['owner']['login']);
  }

  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}
