import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/repository_details/data/data_sources/repository_details_data_source.dart';
import 'package:github_client_flutter/features/repository_details/data/models/repository_details_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDioAdapter extends Mock implements HttpClientAdapter {}

void main() {
  RepositoryDetailsDataSource dataSource;
  MockDioAdapter mockDioAdapter;

  final tDio = Dio()..options.baseUrl = 'https://api.github.com';

  setUp(() {
    mockDioAdapter = MockDioAdapter();
    tDio.httpClientAdapter = mockDioAdapter;
    dataSource = RepositoryDetailsDataSourceImpl(client: tDio);
  });

  final tRepositoryDetails = RepositoryDetailsModel(
      fullName: 'octocat/Hello-World',
      description: 'This your first repo!',
      watchersCount: 80,
      stargazersCount: 80,
      forksCount: 9,
      ownerLogin: 'octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif');

  void setUpMockDioClientSuccess200() {
    final responseBody = ResponseBody.fromString(fixture('user_details.json'), 200, headers: {
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

  group('get repository details', () {
    test('should return [RepositoryDetailsModel] when the response code is 200', () async {
      // arrange
      setUpMockDioClientSuccess200();
      // act
      final result = await dataSource.getRepositoryDetails('', '');
      // assert
      expect(result, equals(tRepositoryDetails));
    });

    test('should throw [ServerException] when the response code is 500 or other', () async {
      // arrange
      setUpMockDioClientFailure500();
      // act
      final call = dataSource.getRepositoryDetails;
      // assert
      expect(() => call('', ''), throwsA(isInstanceOf<ServerException>()));
    });
  });
}