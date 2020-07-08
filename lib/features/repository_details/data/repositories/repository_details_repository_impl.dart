import 'package:flutter/cupertino.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/core/network/network_info.dart';
import 'package:github_client_flutter/features/repository_details/data/data_sources/repository_details_data_source.dart';
import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';
import 'package:github_client_flutter/features/repository_details/domain/repositories/repository_details_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RepositoryDetailsRepository)
class RepositoryDetailsRepositoryImpl implements RepositoryDetailsRepository {
  final RepositoryDetailsDataSource dataSource;
  final NetworkInfo networkInfo;

  RepositoryDetailsRepositoryImpl({@required this.dataSource, @required this.networkInfo});

  @override
  Future<RepositoryDetailsEntity> getRepositoryDetails(String owner, String repo) async {
    if (await networkInfo.isConnected)
      return await dataSource.getRepositoryDetails(owner: owner, repo: repo);
    else
      return Future.error(ServerException(message: 'Check your internet connection'));
  }
}
