import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/core/network/network_info.dart';
import 'package:github_client_flutter/features/user_details/data/data_sources/user_details_data_source.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';
import 'package:github_client_flutter/features/user_details/domain/repositories/user_details_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserDetailsRepository)
class UserDetailsRepositoryImpl implements UserDetailsRepository {
  final UserDetailsDataSource dataSource;
  final NetworkInfo networkInfo;

  UserDetailsRepositoryImpl({@required this.dataSource, @required this.networkInfo});

  @override
  Future<UserDetailsEntity> getUserDetails(String username) async {
    if (await networkInfo.isConnected)
      return await dataSource.getUserDetails(username);
    else
      return Future.error(ServerException(message: 'Check your internet connection'));
  }
}
