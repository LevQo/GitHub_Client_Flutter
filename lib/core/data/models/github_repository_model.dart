import 'package:flutter/cupertino.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';

class GitHubRepositoryModel extends GitHubRepositoryEntity {
  GitHubRepositoryModel(
      {@required int id,
      @required String name,
      @required String description,
      @required String url})
      : super(id: id, name: name, description: description, url: url);

  factory GitHubRepositoryModel.fromJson(Map<String, dynamic> json) {
    return GitHubRepositoryModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        url: json['url']);
  }
}
