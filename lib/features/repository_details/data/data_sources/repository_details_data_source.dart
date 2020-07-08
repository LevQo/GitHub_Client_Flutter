import 'package:dio/dio.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/repository_details/data/models/repository_details_model.dart';
import 'package:injectable/injectable.dart';

abstract class RepositoryDetailsDataSource{
  Future<RepositoryDetailsModel> getRepositoryDetails({String owner, String repo});
}

@LazySingleton(as: RepositoryDetailsDataSource)
class RepositoryDetailsDataSourceImpl implements RepositoryDetailsDataSource{
  final Dio client;

  RepositoryDetailsDataSourceImpl({this.client});

  @override
  Future<RepositoryDetailsModel> getRepositoryDetails({String owner, String repo}) async {
    return await client.get('/repos/$owner/$repo')
        .then(_handleSuccess)
        .catchError(_handleError);
  }

  RepositoryDetailsModel _handleSuccess(Response response) => RepositoryDetailsModel.fromJson(response.data);

  Future<RepositoryDetailsModel> _handleError(e) async {
    String errorMessage = 'Something went wrong...';
    if (e is DioError) {
      final statusCode = e.response?.statusCode;
      if (statusCode == 500) {
        errorMessage = 'Server connection error';
      }
    }
    return Future.error(ServerException(message: errorMessage));
  }
}