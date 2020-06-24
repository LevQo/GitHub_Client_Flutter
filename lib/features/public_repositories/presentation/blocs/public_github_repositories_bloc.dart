import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/public_repositories/domain/use_cases/get_public_github_repositories.dart';
import './bloc.dart';

class PublicGithubRepositoriesBloc
    extends Bloc<PublicGithubRepositoriesEvent, PublicGithubRepositoriesState> {
  final GetPublicGitHubRepositories getAllGitHubRepositories;

  PublicGithubRepositoriesBloc({@required this.getAllGitHubRepositories})
      : assert(getAllGitHubRepositories != null);

  @override
  PublicGithubRepositoriesState get initialState =>
      const PublicGithubRepositoriesState.initial();

  @override
  Stream<PublicGithubRepositoriesState> mapEventToState(
    PublicGithubRepositoriesEvent event,
  ) async* {
    if (event is GetPublicGitHubRepositoriesEvent) {
      yield const PublicGithubRepositoriesState.loading();
      final repositoriesEither =
          await getAllGitHubRepositories(Params(lastRepoId: event.lastRepoId));

      yield repositoriesEither.fold(
          (failure) => const PublicGithubRepositoriesState.error(),
          (repositories) =>
              PublicGithubRepositoriesState.loaded(repositories: repositories));
    }
  }
}
