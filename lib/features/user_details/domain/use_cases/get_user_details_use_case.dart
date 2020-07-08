import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/use_cases/use_case.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';
import 'package:github_client_flutter/features/user_details/domain/repositories/user_details_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserDetailsUseCase implements UseCase<UserDetailsEntity, UserDetailsParams>{
  final UserDetailsRepository repository;

  GetUserDetailsUseCase({@required this.repository});

  @override
  Future<UserDetailsEntity> call(UserDetailsParams params) async {
    return await repository.getUserDetails(params.username);
  }
}

class UserDetailsParams extends Equatable{
  final String username;

  const UserDetailsParams({@required this.username}) : assert(username != null);

  @override
  List<Object> get props => [this.username];
}