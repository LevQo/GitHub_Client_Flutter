import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/public_github_repositories_remote_data_source.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  PublicGitHubRepositoriesRemoteDataSourceImpl dataSource;
  MockDio mockDioClient;

  setUp(() {
    mockDioClient = MockDio();
    dataSource = PublicGitHubRepositoriesRemoteDataSourceImpl(client: mockDioClient);
  });
  
  void setUpMockHttpClientSuccess200(){
    when(mockDioClient.get(any).thenAnswer(
            (_) async => http.Response(fixture('public_repositories.json'), 200));
  }

  void setUpMockHttpClientFailure404(){
    when(mockDioClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('get public github repositories', () {
    final tLastRepoId = 365;
    final jsonMap = json.decode(fixture('public_repositories.json')) as List;
    final List<GitHubRepositoryModel> tGitHubRepositories =
        jsonMap.map((i) => GitHubRepositoryModel.fromJson(i)).toList();

    test('should perform GET request', () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      dataSource.getPublicGitHubRepositories(tLastRepoId);
      // assert
      verify(mockDioClient
          .get('https://api.github.com/repositories/$tLastRepoId', headers: {
        'Content-Type': 'application/json',
      }));
    });

    test(
        'should return list of github repositories when the response code is 200',
        () async {
      // arrange
          setUpMockHttpClientSuccess200();
      // act
      final result = await dataSource.getPublicGitHubRepositories(tLastRepoId);
      // assert
      expect(result, equals(tGitHubRepositories));
    });

    test('should throw ServerException when the response code is 404 or other',
        () async {
      // arrange
      setUpMockHttpClientFailure404();
      // act
      final call = dataSource.getPublicGitHubRepositories;
      // assert
      expect(() => call(tLastRepoId), throwsA(isInstanceOf<ServerException>()));
    });
  });
}
