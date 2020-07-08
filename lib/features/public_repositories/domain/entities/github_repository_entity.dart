import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GitHubRepositoryEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String url;
  final String owner;

  GitHubRepositoryEntity(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.url,
      @required this.owner});

  @override
  List<Object> get props => [id, name, description, url, owner];
}
