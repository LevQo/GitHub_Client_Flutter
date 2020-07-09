import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';
import 'package:github_client_flutter/features/repository_details/domain/use_cases/get_details_use_case.dart';
import 'package:github_client_flutter/features/repository_details/presentation/blocs/bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetRepositoryDetails extends Mock implements GetRepositoryDetailsUseCase {}

void main() {
  MockGetRepositoryDetails mockGetRepositoryDetails;
  RepositoryDetailsBloc bloc;

  setUp(() {
    mockGetRepositoryDetails = MockGetRepositoryDetails();
    bloc = RepositoryDetailsBloc(getRepositoryDetails: mockGetRepositoryDetails);
  });

  final tRepositoryDetails = RepositoryDetailsEntity(
      fullName: 'octocat/Hello-World',
      description: 'This your first repo!',
      watchersCount: 80,
      stargazersCount: 80,
      forksCount: 9,
      ownerLogin: 'octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif');

  test('initialState should be Initial', () {
    // assert
    expect(bloc.initialState, equals(RepositoryDetailsState.initial()));
  });

  group('GetRepositoryDetails', () {
    test('should get repository details from use case', () async {
      // arrange
      when(mockGetRepositoryDetails(any)).thenAnswer((_) async => tRepositoryDetails);
      // act
      bloc.add(RepositoryDetailsEvent.getDetails(owner: '', repo: ''));
      await untilCalled(mockGetRepositoryDetails(any));
      // assert
      verify(mockGetRepositoryDetails(RepositoryDetailsParams(owner: '', repo: '')));
    });

    test(
      'should emit [loading, loaded] when data is gotten successfully',
          () async {
        // arrange
        when(mockGetRepositoryDetails(any)).thenAnswer((_) async => tRepositoryDetails);
        // assert later
        final expected = [
          RepositoryDetailsState.initial(),
          RepositoryDetailsState.loading(),
          RepositoryDetailsState.loaded(details: tRepositoryDetails),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(RepositoryDetailsEvent.getDetails(owner: '', repo: ''));
      },
    );

    test(
      'should emit [loading, error] when getting data fails',
          () async {
        // arrange
        when(mockGetRepositoryDetails(any)).thenAnswer((_) => Future.error(ServerException(message: '')));
        // assert later
        final expected = [
          RepositoryDetailsState.initial(),
          RepositoryDetailsState.loading(),
          RepositoryDetailsState.error(message: ''),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(RepositoryDetailsEvent.getDetails(owner: '', repo: ''));
      },
    );
  });
}