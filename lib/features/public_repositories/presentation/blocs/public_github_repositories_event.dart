import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_github_repositories_event.freezed.dart';

@freezed
abstract class PublicGithubRepositoriesEvent
    with _$PublicGithubRepositoriesEvent {
  const factory PublicGithubRepositoriesEvent.getRepositories() = _GetRepositories;
}

//class GetPublicGitHubRepositoriesEvent extends PublicGithubRepositoriesEvent{
//  final int lastRepoId;
//
//  GetPublicGitHubRepositoriesEvent(this.lastRepoId);
//
//  @override
//  List<Object> get props => [lastRepoId];
//}
