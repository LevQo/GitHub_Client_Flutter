import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/core/network/network_info.dart';
import 'package:github_client_flutter/features/user_details/data/data_sources/user_details_data_source.dart';
import 'package:github_client_flutter/features/user_details/data/models/user_details_model.dart';
import 'package:github_client_flutter/features/user_details/data/repositories/user_details_repository_impl.dart';
import 'package:github_client_flutter/features/user_details/domain/repositories/user_details_repository.dart';
import 'package:mockito/mockito.dart';

class MockDataSource extends Mock implements UserDetailsDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockDataSource mockDataSource;
  MockNetworkInfo mockNetworkInfo;
  UserDetailsRepository userDetailsRepository;

  setUp(() {
    mockDataSource = MockDataSource();
    mockNetworkInfo = MockNetworkInfo();
    userDetailsRepository =
        UserDetailsRepositoryImpl(dataSource: mockDataSource, networkInfo: mockNetworkInfo);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  final tUserDetails = UserDetailsModel(
      login: 'octocat',
      name: 'monalisa octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
      followers: 20,
      following: 0,
      bio: 'There once was...',
      company: 'GitHub',
      location: 'San Francisco');

  group('get user details', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      userDetailsRepository.getUserDetails('');
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return data when the call is successful', () async {
        // arrange
        when(mockDataSource.getUserDetails(any)).thenAnswer((_) async => tUserDetails);
        // act
        final result = await userDetailsRepository.getUserDetails('');
        // assert
        expect(result, tUserDetails);
        verify(mockDataSource.getUserDetails(''));
      });

      test('should return ServerException when the call to server is unsuccessful', () async {
        // arrange
        when(mockDataSource.getUserDetails(any)).thenThrow(ServerException(message: ''));
        // act
        final call = userDetailsRepository.getUserDetails;
        // assert
        expect(() async => await call(''), throwsA(isInstanceOf<ServerException>()));
      });
    });
  });
}
