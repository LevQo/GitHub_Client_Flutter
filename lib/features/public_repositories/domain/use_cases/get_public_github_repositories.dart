import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/errors/failures.dart';
import 'package:github_client_flutter/core/use_cases/use_case.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/domain/repositories/public_github_repos_repository.dart';

class GetPublicGitHubRepositories
    implements UseCase<List<GitHubRepositoryEntity>, Params> {
  final PublicGitHubReposRepository repository;

  GetPublicGitHubRepositories(this.repository);

  @override
  Future<Either<Failure, List<GitHubRepositoryEntity>>> call(
      Params params) async {
    return await repository.getPublicGitHubRepositories(params.lastRepoId);
  }
}

class Params extends Equatable {
  final int lastRepoId;

  Params({@required this.lastRepoId});

  @override
  List<Object> get props => [lastRepoId];
}
