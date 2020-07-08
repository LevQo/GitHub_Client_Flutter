import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/user_details/data/data_sources/user_details_data_source.dart';
import 'package:github_client_flutter/features/user_details/data/models/user_details_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDioAdapter extends Mock implements HttpClientAdapter {}

void main() {
  UserDetailsDataSource dataSource;
  MockDioAdapter mockDioAdapter;

  final tDio = Dio()..options.baseUrl = 'https://api.github.com';

  setUp(() {
    mockDioAdapter = MockDioAdapter();
    tDio.httpClientAdapter = mockDioAdapter;
    dataSource = UserDetailsDataSourceImpl(client: tDio);
  });

  final tUserDetails = UserDetailsModel(
      login: 'octocat',
      name: 'monalisa octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
      followers: 20,
      following: 0,
      bio: 'There once was...',
      company: 'GitHub',
      location: 'San Francisco');

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

  group('get user details', () {
    test('should return user details when the response code is 200', () async {
      // arrange
      setUpMockDioClientSuccess200();
      // act
      final result = await dataSource.getUserDetails('');
      // assert
      expect(result, equals(tUserDetails));
    });

    test('should throw ServerException when the response code is 500 or other', () async {
      // arrange
      setUpMockDioClientFailure500();
      // act
      final call = dataSource.getUserDetails;
      // assert
      expect(() => call(''), throwsA(isInstanceOf<ServerException>()));
    });
  });
}
