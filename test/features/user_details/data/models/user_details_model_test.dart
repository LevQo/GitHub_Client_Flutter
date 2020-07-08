import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/features/user_details/data/models/user_details_model.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tUserDetails = UserDetailsModel(
      login: 'octocat',
      name: 'monalisa octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
      followers: 20,
      following: 0,
      bio: 'There once was...',
      company: 'GitHub',
      location: 'San Francisco');

  test(
    'should be a subclass of UserDetails entity',
        () async {
      // assert
      expect(tUserDetails, isA<UserDetailsEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model from JSON',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('user_details.json'));
        // act
        final result = UserDetailsModel.fromJson(jsonMap);
        // assert
        expect(result, tUserDetails);
      },
    );
  });
}