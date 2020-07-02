import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/use_cases/use_case.dart';
import 'package:github_client_flutter/features/public_repositories/data/models/public_github_repositories_ui_model.dart';
import 'package:github_client_flutter/features/public_repositories/domain/repositories/public_github_repos_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPublicGitHubRepositories implements UseCase<PublicGithubRepositoriesUiModel, Params> {
  final PublicGitHubReposRepository repository;

  GetPublicGitHubRepositories(this.repository);

  @override
  Future<PublicGithubRepositoriesUiModel> call(Params params) async {
    return await repository.getPublicGitHubRepositories(params.lastRepoId);
  }
}

class Params extends Equatable {
  final int lastRepoId;

  Params({@required this.lastRepoId});

  @override
  List<Object> get props => [lastRepoId];
}
