// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:github_client_flutter/core/di/core_module.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:github_client_flutter/core/network/network_info.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/public_github_repositories_local_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/public_github_repositories_remote_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/data/repositories/public_github_repos_repository_impl.dart';
import 'package:github_client_flutter/features/public_repositories/domain/repositories/public_github_repos_repository.dart';
import 'package:github_client_flutter/features/public_repositories/domain/use_cases/get_public_github_repositories.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final coreModule = _$CoreModule();
  g.registerLazySingleton<DataConnectionChecker>(
      () => coreModule.dataConnectionChecker);
  g.registerLazySingleton<Dio>(() => coreModule.dio);
  g.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(g<DataConnectionChecker>()));
  g.registerLazySingleton<PublicGitHubRepositoriesLocalDataSource>(
      () => PublicGitHubRepositoriesLocalDataSourceImpl());
  g.registerLazySingleton<PublicGitHubRepositoriesRemoteDataSource>(
      () => PublicGitHubRepositoriesRemoteDataSourceImpl(client: g<Dio>()));
  g.registerLazySingleton<PublicGitHubReposRepository>(
      () => PublicGitHubReposRepositoryImpl(
            remoteDataSource: g<PublicGitHubRepositoriesRemoteDataSource>(),
            localDataSource: g<PublicGitHubRepositoriesLocalDataSource>(),
            networkInfo: g<NetworkInfo>(),
          ));
  g.registerLazySingleton<GetPublicGitHubRepositories>(
      () => GetPublicGitHubRepositories(g<PublicGitHubReposRepository>()));
  g.registerFactory<PublicGithubRepositoriesBloc>(() =>
      PublicGithubRepositoriesBloc(
          getAllGitHubRepositories: g<GetPublicGitHubRepositories>()));
}

class _$CoreModule extends CoreModule {}
