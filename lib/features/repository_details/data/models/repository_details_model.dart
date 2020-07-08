import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';

class RepositoryDetailsModel extends RepositoryDetailsEntity {
  final String fullName;
  final String description;
  final int watchersCount;
  final int stargazersCount;
  final int forksCount;
  final String ownerLogin;
  final String avatarUrl;

  RepositoryDetailsModel(
      {this.fullName,
      this.description,
      this.watchersCount,
      this.stargazersCount,
      this.forksCount,
      this.ownerLogin,
      this.avatarUrl})
      : super(
            fullName: fullName,
            description: description,
            watchersCount: watchersCount,
            stargazersCount: stargazersCount,
            forksCount: forksCount,
            ownerLogin: ownerLogin,
            avatarUrl: avatarUrl);

  factory RepositoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return RepositoryDetailsModel(
        fullName: json['full_name'],
        description: json['description'],
        watchersCount: json['watchers_count'],
        stargazersCount: json['stargazers_count'],
        forksCount: json['forks_count'],
        ownerLogin: json['owner']['login'],
        avatarUrl: json['owner']['avatar_url'],
    );
  }
}
