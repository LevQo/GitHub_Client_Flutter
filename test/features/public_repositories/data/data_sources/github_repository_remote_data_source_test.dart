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

  void setUpMockHttpClientSuccess200() {
    final responseBody = ResponseBody.fromString(fixture('public_repositories.json'), 200);

    when(mockDioAdapter.fetch(any, any, any)).thenAnswer((_) async => responseBody);
//    when(mockDioClient.get(any)).thenAnswer(_) async => http.Response(fixture('public_repositories.json'), 200)));
  }

  void setUpMockHttpClientFailure404() {
    when(tDio.get(any)).thenAnswer((_) async => Response(statusCode: 404));

//    when(mockDioClient.get(any))
//    .
//        .then((_) async => http.Response('Something went wrong', 404));
  }

  //TODO: Доделать тесты
  group('get public github repositories', () {
    final tLastRepoId = 365;
    final jsonMap = json.decode(fixture('public_repositories.json')) as List;
    final List<GitHubRepositoryModel> tGitHubRepositories =
        jsonMap.map((i) => GitHubRepositoryModel.fromJson(i)).toList();

    test('should perform GET request', () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      await dataSource.getPublicGitHubRepositories(tLastRepoId);
      // assert
      verify(tDio.get('/repositories', queryParameters: {'since': tLastRepoId}));
    });

    test('should return list of github repositories when the response code is 200', () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result = await dataSource.getPublicGitHubRepositories(tLastRepoId);
      // assert
      expect(result, equals(tGitHubRepositories));
    });

    test('should throw ServerException when the response code is 404 or other', () async {
      // arrange
      setUpMockHttpClientFailure404();
      // act
      final call = dataSource.getPublicGitHubRepositories;
      // assert
      expect(() => call(tLastRepoId), throwsA(isInstanceOf<ServerException>()));
    });
  });
}
