import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/features/repository_details/data/models/repository_details_model.dart';
import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main(){
  final tRepositoryDetails = RepositoryDetailsModel(
      fullName: 'octocat/Hello-World',
      description: 'This your first repo!',
      watchersCount: 80,
      stargazersCount: 80,
      forksCount: 9,
      ownerLogin: 'octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif');

  test(
    'should be a subclass of UserDetails entity',
        () async {
      // assert
      expect(tRepositoryDetails, isA<RepositoryDetailsEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model from JSON',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('repository_details.json'));
        // act
        final result = RepositoryDetailsModel.fromJson(jsonMap);
        // assert
        expect(result, tRepositoryDetails);
      },
    );
  });
}