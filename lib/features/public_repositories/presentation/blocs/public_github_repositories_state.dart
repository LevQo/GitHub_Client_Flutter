import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';

part 'public_github_repositories_state.freezed.dart';

@freezed
abstract class PublicGithubRepositoriesState
    with _$PublicGithubRepositoriesState {
  const factory PublicGithubRepositoriesState.initial() = _Initial;

  const factory PublicGithubRepositoriesState.loading() = _Loading;

  const factory PublicGithubRepositoriesState.loaded(
      {@required List<GitHubRepositoryEntity> repositories}) = _Loaded;

  const factory PublicGithubRepositoriesState.error({String message}) = _Error;
}

//class InitialState extends PublicGithubRepositoriesState {
//  @override
//  List<Object> get props => [];
//}
//
//class LoadingState extends PublicGithubRepositoriesState {
//  @override
//  List<Object> get props => [];
//}
//
//class LoadedState extends PublicGithubRepositoriesState{
//  final List<GitHubRepositoryEntity> repositories;
//
//  LoadedState({@required this.repositories});
//
//  @override
//  List<Object> get props => [repositories];
//}
//
//class ErrorState extends PublicGithubRepositoriesState{
//  final String message;
//
//  ErrorState({this.message});
//
//  @override
//  List<Object> get props => [message];
//}
