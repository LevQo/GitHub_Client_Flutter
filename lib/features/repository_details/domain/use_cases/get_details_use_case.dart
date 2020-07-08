import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_client_flutter/core/use_cases/use_case.dart';
import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';
import 'package:github_client_flutter/features/repository_details/domain/repositories/repository_details_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetDetailsRepositoryUseCase implements UseCase<RepositoryDetailsEntity, RepositoryDetailsParams>{
  final RepositoryDetailsRepository repository;

  GetDetailsRepositoryUseCase({this.repository});

  @override
  Future<RepositoryDetailsEntity> call(RepositoryDetailsParams params) async {
    return await repository.getRepositoryDetails(params.owner, params.repo);
  }
}

class RepositoryDetailsParams extends Equatable{
  final String owner;
  final String repo;

  RepositoryDetailsParams({@required this.owner, @required this.repo});

  @override
  List<Object> get props => [this.owner, this.repo];
}