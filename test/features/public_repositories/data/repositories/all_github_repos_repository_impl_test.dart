import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/constants/db_boxes.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/core/errors/failures.dart';
import 'package:github_client_flutter/core/network/network_info.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/public_github_repositories_local_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/public_github_repositories_remote_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/data/repositories/public_github_repos_repository_impl.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements PublicGitHubRepositoriesRemoteDataSource {}

class MockLocalDataSource extends Mock
    implements PublicGitHubRepositoriesLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() async {
  PublicGitHubReposRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;
  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = PublicGitHubReposRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
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
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  group('get all public GitHub repositories', () {
    final tGitHubRepositoryModel = GitHubRepositoryModel(
        id: 0, name: 'name', description: 'description', url: 'url');
    final List<GitHubRepositoryModel> tGitHubRepositoriesList = [
      tGitHubRepositoryModel
    ];

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      repository.getPublicGitHubRepositories(100);
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote source is successful',
          () async {
        //arrange
        when(mockRemoteDataSource.getPublicGitHubRepositories(any))
            .thenAnswer((_) async => tGitHubRepositoriesList);
        //act
        final result = await repository.getPublicGitHubRepositories(100);
        //assert
        verify(mockRemoteDataSource.getPublicGitHubRepositories(100));
        verify(mockLocalDataSource.savePublicGitHubRepositoriesToCache(any));
      });

      test(
          'should return server failure when the call to remote source is unsuccessful',
          () async {
        //arrange
        when(mockRemoteDataSource.getPublicGitHubRepositories(any))
            .thenThrow(ServerException());
        //act
        final result = await repository.getPublicGitHubRepositories(100);
        //assert
        verify(mockRemoteDataSource.getPublicGitHubRepositories(100));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return last loaded list of repositories from cache',
          () async {

      });
    });
  });
}
