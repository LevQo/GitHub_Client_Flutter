import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/core/network/network_info.dart';
import 'package:github_client_flutter/features/repository_details/data/data_sources/repository_details_data_source.dart';
import 'package:github_client_flutter/features/repository_details/data/models/repository_details_model.dart';
import 'package:github_client_flutter/features/repository_details/data/repositories/repository_details_repository_impl.dart';
import 'package:github_client_flutter/features/repository_details/domain/repositories/repository_details_repository.dart';
import 'package:mockito/mockito.dart';

class MockDataSource extends Mock implements RepositoryDetailsDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockDataSource mockDataSource;
  MockNetworkInfo mockNetworkInfo;
  RepositoryDetailsRepository repository;

  setUp(() {
    mockDataSource = MockDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = RepositoryDetailsRepositoryImpl(dataSource: mockDataSource, networkInfo: mockNetworkInfo);
  });

  final tRepositoryDetails = RepositoryDetailsModel(
      fullName: 'octocat/Hello-World',
      description: 'This your first repo!',
      watchersCount: 80,
      stargazersCount: 80,
      forksCount: 9,
      ownerLogin: 'octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif');

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  group('get repository details', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getRepositoryDetails('', '');
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return [RepositoryDetailsModel] when the call is successful', () async {
        // arrange
        when(mockDataSource.getRepositoryDetails(any, any)).thenAnswer((_) async => tRepositoryDetails);
        // act
        final result = await repository.getRepositoryDetails('', '');
        // assert
        expect(result, tRepositoryDetails);
        verify(mockDataSource.getRepositoryDetails('', ''));
      });

      test('should return [ServerException] when the call to server is unsuccessful', () async {
        // arrange
        when(mockDataSource.getRepositoryDetails(any, any)).thenThrow(ServerException(message: ''));
        // act
        final call = repository.getRepositoryDetails;
        // assert
        expect(() async => await call('', ''), throwsA(isInstanceOf<ServerException>()));
      });
    });
  });
}
