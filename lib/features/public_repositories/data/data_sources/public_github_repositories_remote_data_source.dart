import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class PublicGitHubRepositoriesRemoteDataSource {
  Future<List<GitHubRepositoryModel>> getPublicGitHubRepositories(
      int lastRepoId);
}

@LazySingleton(as: PublicGitHubRepositoriesRemoteDataSource)
class PublicGitHubRepositoriesRemoteDataSourceImpl
    implements PublicGitHubRepositoriesRemoteDataSource {
  final Dio client;

  PublicGitHubRepositoriesRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<GitHubRepositoryModel>> getPublicGitHubRepositories(
      int lastRepoId) async {
    try {
      final response = await client.get('/repositories',
          queryParameters: {'since': lastRepoId});
      return (response.data as List)
          .map((i) => GitHubRepositoryModel.fromJson(i))
          .toList();
    } on DioError catch (e) {
      String errorMessage;
      final statusCode = e.response.statusCode;
      if(statusCode == 500){
        errorMessage = 'Ошибка соединения с сервером';
      } else {
        errorMessage = 'Что-то пошло не так...';
      }
      throw ServerException(message: errorMessage);
    }
  }
}
