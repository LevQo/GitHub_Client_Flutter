import 'package:flutter/cupertino.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';

class PublicGithubRepositoriesUiModel {
  final List<GitHubRepositoryEntity> repositories;
  final bool isCache;

  PublicGithubRepositoriesUiModel({@required this.repositories, this.isCache = false})
      : assert(repositories != null);
}
