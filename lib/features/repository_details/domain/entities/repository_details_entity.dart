import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class RepositoryDetailsEntity extends Equatable {
  final String fullName;
  final String description;
  final int watchersCount;
  final int stargazersCount;
  final int forksCount;
  final String ownerLogin;
  final String avatarUrl;

  RepositoryDetailsEntity(
      {@required this.fullName,
      @required this.description,
      @required this.watchersCount,
      @required this.stargazersCount,
      @required this.forksCount,
      @required this.ownerLogin,
      @required this.avatarUrl});

  @override
  List<Object> get props => [
        this.fullName,
        this.description,
        this.watchersCount,
        this.stargazersCount,
        this.forksCount,
        this.ownerLogin,
        this.avatarUrl
      ];
}
