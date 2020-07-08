import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';

class UserDetailsModel extends UserDetailsEntity {
  final String login;
  final String name;
  final String avatarUrl;
  final int followers;
  final int following;
  final String bio;
  final String company;
  final String location;

  const UserDetailsModel(
      {@required this.login,
      @required this.name,
      @required this.avatarUrl,
      @required this.followers,
      @required this.following,
      this.bio,
      this.company,
      this.location})
      : super(
            login: login,
            name: name,
            avatarUrl: avatarUrl,
            followers: followers,
            following: following,
            bio: bio,
            company: company,
            location: location);

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
        login: json['login'],
        name: json['name'],
        avatarUrl: json['avatar_url'],
        followers: json['followers'],
        following: json['following'],
        bio: json['bio'],
        company: json['company'],
        location: json['location']);
  }
}
