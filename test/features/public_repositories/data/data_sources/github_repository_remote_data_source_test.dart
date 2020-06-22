import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/github_repository_remote_data_source.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  PublicGitHubRepositoriesRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = PublicGitHubRepositoriesRemoteDataSourceImpl(client: mockHttpClient);
  });
  
  void setUpMockHttpClientSuccess200(){
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response(fixture('public_repositories.json'), 200));
  }

  void setUpMockHttpClientFailure404(){
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
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
      verify(mockHttpClient
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
