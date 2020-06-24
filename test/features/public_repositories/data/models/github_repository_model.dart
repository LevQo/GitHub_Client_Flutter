import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tGitHubRepositoryModel = GitHubRepositoryModel(
      id: 0, name: 'name', description: 'description', url: 'url');

  test('should be a subclass of GitHubRepositoryEntity', () async {
    expect(tGitHubRepositoryModel, isA<GitHubRepositoryEntity>());
  });
  
  group('fromJson', (){
    test('should return non-empty list of public github repositories', () async {
      //arrange
      final List<dynamic> jsonMap = json.decode(fixture('public_repositories.json'));
      //act
      final result = jsonMap.map((i) => GitHubRepositoryModel.fromJson(i)).toList();
      //assert
      expect(true, result.isNotEmpty);
    });
  });
}
