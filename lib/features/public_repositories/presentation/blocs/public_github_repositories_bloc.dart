import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_client_flutter/features/public_repositories/domain/use_cases/get_public_github_repositories.dart';
import './bloc.dart';

class PublicGithubRepositoriesBloc extends Bloc<PublicGithubRepositoriesEvent,
    PublicGithubRepositoriesState> {
  final GetPublicGitHubRepositories getAllGitHubRepositories;

  PublicGithubRepositoriesBloc({@required this.getAllGitHubRepositories})
      : assert(getAllGitHubRepositories != null);

  @override
  PublicGithubRepositoriesState get initialState => InitialState();

  @override
  Stream<PublicGithubRepositoriesState> mapEventToState(
    PublicGithubRepositoriesEvent event,
  ) async* {
    if (event is GetPublicGitHubRepositoriesEvent) {
      yield LoadingState();
      final repositoriesEither =
          await getAllGitHubRepositories(Params(lastRepoId: event.lastRepoId));

      yield repositoriesEither.fold((failure) => ErrorState(),
          (repositories) => LoadedState(repositories: repositories));
    }
  }

}
