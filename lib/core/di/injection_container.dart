import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:github_client_flutter/core/network/network_info.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/github_repository_remote_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/data/repositories/public_github_repos_repository_impl.dart';
import 'package:github_client_flutter/features/public_repositories/domain/repositories/public_github_repos_repository.dart';
import 'package:github_client_flutter/features/public_repositories/domain/use_cases/get_public_github_repositories.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_bloc.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

void init() {
  // Core
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Features - All public GitHub repositories
  // Bloc
  sl.registerFactory(
      () => PublicGithubRepositoriesBloc(getAllGitHubRepositories: sl()));

  //Use Cases
  sl.registerLazySingleton(() => GetPublicGitHubRepositories(sl(),));

  //Repository
  sl.registerLazySingleton<PublicGitHubReposRepository>(
      () => (PublicGitHubReposRepositoryImpl(
            remoteDataSource: sl(),
            localDataSource: null,
            networkInfo: sl(),
          )));

  //Data Sources
  sl.registerLazySingleton<PublicGitHubRepositoriesRemoteDataSource>(
      () => PublicGitHubRepositoriesRemoteDataSourceImpl(
            client: sl(),
          ));
}
