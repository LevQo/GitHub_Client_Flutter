import 'package:dartz/dartz.dart';
import 'package:github_client_flutter/core/errors/failures.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';

abstract class PublicGitHubReposRepository {
  Future<Either<Failure, List<GitHubRepositoryEntity>>>
      getPublicGitHubRepositories(int lastRepoId);
}
