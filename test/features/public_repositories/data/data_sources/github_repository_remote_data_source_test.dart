import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/public_repositories/data/data_sources/public_github_repositories_remote_data_source.dart';
import 'package:github_client_flutter/features/public_repositories/data/models/github_repository_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDioAdapter extends Mock implements HttpClientAdapter {}

void main() {
  final tDio = Dio()..options.baseUrl = 'https://api.github.com';
  PublicGitHubRepositoriesRemoteDataSourceImpl dataSource;
  MockDioAdapter mockDioAdapter;

  setUp(() {
    mockDioAdapter = MockDioAdapter();
    tDio.httpClientAdapter = mockDioAdapter;
    dataSource = PublicGitHubRepositoriesRemoteDataSourceImpl(client: tDio);
  });

  void setUpMockDioClientSuccess200() {
    final responseBody = ResponseBody.fromString(fixture('public_repositories.json'), 200, headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType]
    });

    when(mockDioAdapter.fetch(any, any, any)).thenAnswer((_) async => responseBody);
  }

  void setUpMockDioClientFailure500() {
    final responseBody = ResponseBody.fromString('', 500, headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType]
    });

    when(mockDioAdapter.fetch(any, any, any)).thenAnswer((_) async => responseBody);
  }

  group('get public github repositories', () {
    final tLastRepoId = 365;
    final jsonMap = json.decode(fixture('public_repositories.json')) as List;
    final List<GitHubRepositoryModel> tGitHubRepositories =
        jsonMap.map((i) => GitHubRepositoryModel.fromJson(i)).toList();

    test('should return list of github repositories when the response code is 200', () async {
      // arrange
      setUpMockDioClientSuccess200();
      // act
      final result = await dataSource.getPublicGitHubRepositories(tLastRepoId);
      // assert
      expect(result, tGitHubRepositories);
    });

    test('should throw [ServerException] when the response code is 500 or other', () async {
      // arrange
      setUpMockDioClientFailure500();
      // act
      final call = dataSource.getPublicGitHubRepositories;
      // assert
      expect(() => call(tLastRepoId), throwsA(isInstanceOf<ServerException>()));
    });
  });
}
