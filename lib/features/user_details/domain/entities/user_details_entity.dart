import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserDetailsEntity extends Equatable {
  final String login;
  final String name;
  final String avatarUrl;
  final int followers;
  final int following;
  final String bio;
  final String company;
  final String location;

  const UserDetailsEntity(
      {@required this.login,
      @required this.name,
      @required this.avatarUrl,
      @required this.followers,
      @required this.following,
      this.bio,
      this.company,
      this.location});

  @override
  List<Object> get props => [
        this.login,
        this.name,
        this.avatarUrl,
        this.followers,
        this.following,
        this.bio,
        this.company,
        this.location
      ];
}
