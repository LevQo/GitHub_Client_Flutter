import 'package:equatable/equatable.dart';

abstract class PublicGithubRepositoriesEvent extends Equatable {
  const PublicGithubRepositoriesEvent();
}

class GetPublicGitHubRepositoriesEvent extends PublicGithubRepositoriesEvent{
  final int lastRepoId;

  GetPublicGitHubRepositoriesEvent(this.lastRepoId);

  @override
  List<Object> get props => [lastRepoId];
}
