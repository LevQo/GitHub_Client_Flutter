import 'package:github_client_flutter/features/public_repositories/data/models/public_github_repositories_ui_model.dart';

abstract class PublicGitHubReposRepository {
  Future<PublicGithubRepositoriesUiModel> getPublicGitHubRepositories(int lastRepoId);
}
