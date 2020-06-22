import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:http/http.dart' as http;

abstract class PublicGitHubRepositoriesRemoteDataSource {
  Future<List<GitHubRepositoryModel>> getPublicGitHubRepositories(
      int lastRepoId);
}

class PublicGitHubRepositoriesRemoteDataSourceImpl
    implements PublicGitHubRepositoriesRemoteDataSource {
  final http.Client client;

  PublicGitHubRepositoriesRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<GitHubRepositoryModel>> getPublicGitHubRepositories(
      int lastRepoId) async {
    final response = await client.get(
        'https://api.github.com/repositories?since=$lastRepoId',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((i) => GitHubRepositoryModel.fromJson(i))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
