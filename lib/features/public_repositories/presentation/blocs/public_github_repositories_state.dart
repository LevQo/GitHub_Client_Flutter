import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';

abstract class PublicGithubRepositoriesState extends Equatable {
  const PublicGithubRepositoriesState();
}

class InitialState extends PublicGithubRepositoriesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PublicGithubRepositoriesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PublicGithubRepositoriesState{
  final List<GitHubRepositoryEntity> repositories;

  LoadedState({@required this.repositories});

  @override
  List<Object> get props => [repositories];
}

class ErrorState extends PublicGithubRepositoriesState{
  final String message;

  ErrorState({this.message});

  @override
  List<Object> get props => [message];
}
