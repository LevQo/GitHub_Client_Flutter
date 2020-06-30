import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_github_repositories_event.freezed.dart';

@freezed
abstract class PublicGithubRepositoriesEvent
    with _$PublicGithubRepositoriesEvent {
  const factory PublicGithubRepositoriesEvent.getRepositories(
      {bool isRefresh}) = _GetRepositories;
}
