import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/public_repositories/data/models/public_github_repositories_ui_model.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/domain/use_cases/get_public_github_repositories.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

@injectable
class PublicGithubRepositoriesBloc
    extends Bloc<PublicGithubRepositoriesEvent, PublicGithubRepositoriesState> {
  final GetPublicGitHubRepositories getAllGitHubRepositories;

  int _lastRepoId;
  List<GitHubRepositoryEntity> _currentRepositories = [];

  PublicGithubRepositoriesBloc({@required this.getAllGitHubRepositories})
      : assert(getAllGitHubRepositories != null);

  @override
  PublicGithubRepositoriesState get initialState => const PublicGithubRepositoriesState.initial();

  @override
  Stream<PublicGithubRepositoriesState> mapEventToState(
    PublicGithubRepositoriesEvent event,
  ) async* {
    yield* event.when(getRepositories: (isRefresh) async* {
      yield* _mapToLoadedState(isRefresh);
    });
  }

  Stream<PublicGithubRepositoriesState> _mapToLoadedState(bool isRefresh) async* {
    if (isRefresh == true) {
      _lastRepoId = null;
      _currentRepositories = [];
    }

    final currentState = state;
    if (_lastRepoId != null && currentState is Loaded) {
      yield PublicGithubRepositoriesState.loadingNextPage(currentRepositories: currentState.repositories);
    } else if (isRefresh != true) {
      yield const PublicGithubRepositoriesState.loading();
    }

//    yield await getAllGitHubRepositories
//        .getRepos(Params(lastRepoId: _lastRepoId))
//        .then(_handleSuccess)
//        .catchError(_handleError);

    yield* getAllGitHubRepositories
        .getRepos(Params(lastRepoId: _lastRepoId))
        .map((event) => PublicGithubRepositoriesState.error(message: '123'));
  }

  PublicGithubRepositoriesState _handleSuccess(PublicGithubRepositoriesUiModel uiModel) {
    _lastRepoId = uiModel.repositories.last.id;
    final resultRepositories = _currentRepositories..addAll(uiModel.repositories);
    return PublicGithubRepositoriesState.loaded(repositories: resultRepositories);
  }

  PublicGithubRepositoriesState _handleError(e) {
    return PublicGithubRepositoriesState.error(message: e?.message);
  }
}
