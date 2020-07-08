import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';
import 'package:github_client_flutter/features/user_details/domain/use_cases/get_user_details_use_case.dart';
import 'package:github_client_flutter/features/user_details/presentation/blocs/bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetUserDetailsUseCase extends Mock implements GetUserDetailsUseCase {}

void main() {
  MockGetUserDetailsUseCase mockGetUserDetails;
  UserDetailsBloc bloc;

  setUp(() {
    mockGetUserDetails = MockGetUserDetailsUseCase();
    bloc = UserDetailsBloc(getUserDetails: mockGetUserDetails);
  });

  final tUserDetails = UserDetailsEntity(
      login: 'octocat',
      name: 'monalisa octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
      followers: 20,
      following: 0,
      bio: 'There once was...',
      company: 'GitHub',
      location: 'San Francisco');

  test('initialState should be Initial', () {
    // assert
    expect(bloc.initialState, equals(UserDetailsState.initial()));
  });

  group('GetUserDetails', () {
    test('should get user details from use case', () async {
      // arrange
      when(mockGetUserDetails(any)).thenAnswer((_) async => tUserDetails);
      // act
      bloc.add(UserDetailsEvent.getDetails(username: ''));
      await untilCalled(mockGetUserDetails(any));
      // assert
      verify(mockGetUserDetails(UserDetailsParams(username: '')));
    });

    test(
      'should emit [loading, loaded] when data is gotten successfully',
      () async {
        // arrange
        when(mockGetUserDetails(any)).thenAnswer((_) async => tUserDetails);
        // assert later
        final expected = [
          UserDetailsState.initial(),
          UserDetailsState.loading(),
          UserDetailsState.loaded(details: tUserDetails),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(UserDetailsEvent.getDetails(username: ''));
      },
    );

    test(
      'should emit [loading, error] when getting data fails',
      () async {
        // arrange
        when(mockGetUserDetails(any)).thenAnswer((_) => Future.error(ServerException(message: '')));
        // assert later
        final expected = [
          UserDetailsState.initial(),
          UserDetailsState.loading(),
          UserDetailsState.error(message: ''),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(UserDetailsEvent.getDetails(username: ''));
      },
    );
  });
}
