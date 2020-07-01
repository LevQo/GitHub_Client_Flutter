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
  Future<Either<Failure, List<GitHubRepositoryEntity>>> getPublicGitHubRepositories(int lastRepoId) async {
    if (await networkInfo.isConnected) {
      try {
        final repositories = await remoteDataSource.getPublicGitHubRepositories(lastRepoId);
        localDataSource.savePublicGitHubRepositoriesToCache(repositories);
        return Right(repositories);
      } on ServerException catch (e) {
        try {
          await localDataSource
              .getPublicGitHubRepositoriesFromCache()
              .then((repositories) => Right(repositories))
              .catchError(() => Left(CacheFailure(message: e.message)));

          final cachePublicGitHubRepositories =
              await localDataSource.getPublicGitHubRepositoriesFromCache().catchError(() {});

          return Right(cachePublicGitHubRepositories);
        } on CacheException catch (e) {
          return Left(CacheFailure(message: e.message));
        }
        return Left(ServerFailure(message: e.message));
      }
    } else {
      try {
        final cachePublicGitHubRepositories = await localDataSource.getPublicGitHubRepositoriesFromCache();
        return Right(cachePublicGitHubRepositories);
      } on CacheException catch (e) {
        return Left(CacheFailure(message: e.message));
      }
    }
  }

  @override
  Stream<PublicGithubRepositoriesUiModel> getPublicGitHubRepositories1(int lastRepoId) async* {
    if (await networkInfo.isConnected) {
      yield await remoteDataSource
          .getPublicGitHubRepositories(lastRepoId)
          .then((repositories) => _handleSuccessRemote(repositories))
          .catchError((e) {});
    } else {
      yield await localDataSource
          .getPublicGitHubRepositoriesFromCache()
          .then((repositories) => PublicGithubRepositoriesUiModel(repositories: repositories, isCache: true));
    }
  }

  PublicGithubRepositoriesUiModel _handleSuccessRemote(List<GitHubRepositoryModel> repositories) {
    localDataSource.savePublicGitHubRepositoriesToCache(repositories);
    return PublicGithubRepositoriesUiModel(repositories: repositories);
  }
}
