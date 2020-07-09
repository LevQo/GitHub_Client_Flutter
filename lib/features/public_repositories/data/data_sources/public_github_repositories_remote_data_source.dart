import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/public_repositories/data/models/github_repository_model.dart';
import 'package:injectable/injectable.dart';

abstract class PublicGitHubRepositoriesRemoteDataSource {
  Future<List<GitHubRepositoryModel>> getPublicGitHubRepositories(int lastRepoId);
}

@LazySingleton(as: PublicGitHubRepositoriesRemoteDataSource)
class PublicGitHubRepositoriesRemoteDataSourceImpl implements PublicGitHubRepositoriesRemoteDataSource {
  final Dio client;

  PublicGitHubRepositoriesRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<GitHubRepositoryModel>> getPublicGitHubRepositories(int lastRepoId) async {
    return await client
        .get('/repositories', queryParameters: {'since': lastRepoId})
        .then(_handleSuccess)
        .catchError(_handleError);
  }

  List<GitHubRepositoryModel> _handleSuccess(Response response) =>
      (response.data as List).map((i) => GitHubRepositoryModel.fromJson(i)).toList();

  Future<List<GitHubRepositoryModel>> _handleError(e) async =>
      Future.error(ServerException(message: e.parseMessage));
}
