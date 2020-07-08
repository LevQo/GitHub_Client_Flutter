import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';

class PublicGithubRepositoriesUiModel extends Equatable {
  final List<GitHubRepositoryEntity> repositories;
  final bool isCache;
  final String snackMessage;

  PublicGithubRepositoriesUiModel({@required this.repositories, this.isCache = false, this.snackMessage})
      : assert(repositories != null);

  @override
  List<Object> get props => [repositories, isCache, snackMessage];
}
