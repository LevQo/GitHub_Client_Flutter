import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/failures.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/domain/use_cases/get_public_github_repositories.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_bloc.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_state.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetAllGitHubRepositories extends Mock
    implements GetPublicGitHubRepositories {}

void main() {
  PublicGithubRepositoriesBloc bloc;
  MockGetAllGitHubRepositories mockGetAllGitHubRepositories;

  setUp(() {
    mockGetAllGitHubRepositories = MockGetAllGitHubRepositories();
    bloc = PublicGithubRepositoriesBloc(
        getAllGitHubRepositories: mockGetAllGitHubRepositories);
  });

  test('initialState should be InitialState', () {
    expect(bloc.initialState, equals(PublicGithubRepositoriesState.initial()));
  });

//  group('GetAllPublicGitHubRepositories', () {
//    test('should get public github repositories', () async {
//      // arrange
//      when(mockGetAllGitHubRepositories(any))
//          .thenAnswer((_) async => Right([GitHubRepositoryEntity()]));
//      // act
//      bloc.add(GetPublicGitHubRepositoriesEvent(365));
//      await untilCalled(mockGetAllGitHubRepositories(any));
//      // assert
//      verify(mockGetAllGitHubRepositories(Params(lastRepoId: 365)));
//    });
//
//    test(
//        'should emit [LoadingState, LoadedState] when data is gotten successfully',
//        () async {
//          // arrange
//          when(mockGetAllGitHubRepositories(any))
//              .thenAnswer((_) async => Right([GitHubRepositoryEntity()]));
//
//          // assert later
//          final expected = [
//            InitialState(),
//            LoadingState(),
//            LoadedState(repositories: [GitHubRepositoryEntity()])
//          ];
//          expectLater(bloc, emitsInOrder(expected));
//
//          //act
//          bloc.add(GetPublicGitHubRepositoriesEvent(365));
//        });
//
//    test(
//        'should emit [LoadingState, ErrorState] when data is gotten error',
//            () async {
//          // arrange
//          when(mockGetAllGitHubRepositories(any))
//              .thenAnswer((_) async => Left(ServerFailure()));
//
//          // assert later
//          final expected = [
//            InitialState(),
//            LoadingState(),
//            ErrorState()
//          ];
//          expectLater(bloc, emitsInOrder(expected));
//
//          //act
//          bloc.add(GetPublicGitHubRepositoriesEvent(365));
//        });
//  });
}
