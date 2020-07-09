import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/public_repositories/data/models/public_github_repositories_ui_model.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/domain/use_cases/get_public_github_repositories.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_bloc.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_state.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetAllGitHubRepositories extends Mock implements GetPublicGitHubRepositories {}

void main() {
  PublicGithubRepositoriesBloc bloc;
  MockGetAllGitHubRepositories mockGetAllGitHubRepositories;

  setUp(() {
    mockGetAllGitHubRepositories = MockGetAllGitHubRepositories();
    bloc = PublicGithubRepositoriesBloc(getAllGitHubRepositories: mockGetAllGitHubRepositories);
  });

  final tGitHubRepositoriesUiModel = PublicGithubRepositoriesUiModel(
      repositories: [GitHubRepositoryEntity(id: 0, name: '', description: '', url: '', owner: '')]);

  test('initialState should be InitialState', () {
    expect(bloc.initialState, equals(PublicGithubRepositoriesState.initial()));
  });

  group('GetAllPublicGitHubRepositories', () {
    test('should get public github repositories', () async {
      // arrange
      when(mockGetAllGitHubRepositories(any)).thenAnswer((_) async => tGitHubRepositoriesUiModel);
      // act
      bloc.add(PublicGithubRepositoriesEvent.getRepositories(isRefresh: false));
      await untilCalled(mockGetAllGitHubRepositories(any));
      // assert
      verify(mockGetAllGitHubRepositories(Params(lastRepoId: null)));
    });

    test('should emit LoadingState, LoadedState when data is gotten successfully', () async {
      // arrange
      when(mockGetAllGitHubRepositories(any)).thenAnswer((_) async => tGitHubRepositoriesUiModel);

      // assert later
      final expected = [
        PublicGithubRepositoriesState.initial(),
        PublicGithubRepositoriesState.loading(),
        PublicGithubRepositoriesState.loaded(
            repositories: tGitHubRepositoriesUiModel.repositories, isCache: false)
      ];
      expectLater(bloc, emitsInOrder(expected));

      // act
      bloc.add(PublicGithubRepositoriesEvent.getRepositories(isRefresh: false));
    });

    test('should emit LoadingState, ErrorState when data is gotten error', () async {
      // arrange
      when(mockGetAllGitHubRepositories(any)).thenAnswer((_) => Future.error(ServerException(message: '')));

      // assert later
      final expected = [
        PublicGithubRepositoriesState.initial(),
        PublicGithubRepositoriesState.loading(),
        PublicGithubRepositoriesState.error(message: '')
      ];
      expectLater(bloc, emitsInOrder(expected));

      // act
      bloc.add(PublicGithubRepositoriesEvent.getRepositories(isRefresh: false));
    });
  });
}
