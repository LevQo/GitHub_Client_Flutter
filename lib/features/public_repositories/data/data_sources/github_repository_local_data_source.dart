import 'package:github_client_flutter/core/data/models/github_repository_model.dart';

abstract class PublicGitHubRepositoriesLocalDataSource {
  Future<List<GitHubRepositoryModel>> getPublicGitHubRepositoriesFromCache();
}
