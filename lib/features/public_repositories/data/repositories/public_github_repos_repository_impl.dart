import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/core/errors/failures.dart';
import 'package:github_client_flutter/core/network/network_info.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/public_github_repositories_local_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/public_github_repositories_remote_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/data/models/public_github_repositories_ui_model.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/domain/repositories/public_github_repos_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PublicGitHubReposRepository)
class PublicGitHubReposRepositoryImpl implements PublicGitHubReposRepository {
  final PublicGitHubRepositoriesRemoteDataSource remoteDataSource;
  final PublicGitHubRepositoriesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PublicGitHubReposRepositoryImpl(
      {@required this.remoteDataSource, @required this.localDataSource, @required this.networkInfo});

  @override
  Future<PublicGithubRepositoriesUiModel> getPublicGitHubRepositories(int lastRepoId) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource
          .getPublicGitHubRepositories(lastRepoId)
          .then((repositories) => _handleSuccessRemote(repositories));
    } else {
      return await localDataSource.getPublicGitHubRepositoriesFromCache().then((repositories) =>
          PublicGithubRepositoriesUiModel(
              repositories: repositories,
              isCache: true,
              snackMessage: 'Проверьте ваше интернет соединение. Данные полученны из кэша'));
    }
  }

  PublicGithubRepositoriesUiModel _handleSuccessRemote(List<GitHubRepositoryModel> repositories) {
    localDataSource.savePublicGitHubRepositoriesToCache(repositories);
    return PublicGithubRepositoriesUiModel(repositories: repositories);
  }
}
