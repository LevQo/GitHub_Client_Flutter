import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';

abstract class RepositoryDetailsRepository{
  Future<RepositoryDetailsEntity> getRepositoryDetails(String owner, String repo);
}