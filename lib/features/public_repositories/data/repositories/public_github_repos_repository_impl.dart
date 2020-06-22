import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/core/errors/failures.dart';
import 'package:github_client_flutter/core/network/network_info.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/github_repository_local_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/github_repository_remote_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/domain/repositories/public_github_repos_repository.dart';

class PublicGitHubReposRepositoryImpl implements PublicGitHubReposRepository {
  final PublicGitHubRepositoriesRemoteDataSource remoteDataSource;
  final PublicGitHubRepositoriesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PublicGitHubReposRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, List<GitHubRepositoryEntity>>>
      getPublicGitHubRepositories(int lastRepoId) async {
    if (await networkInfo.isConnected) {
      try {
//        localDataSource.getPublicRepositoriesFromCache();
        return Right(await remoteDataSource.getPublicGitHubRepositories(100));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
//        final cacheGitHubRepositories =
//            await localDataSource.getPublicRepositoriesFromCache();
//        return Right(cacheGitHubRepositories);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
