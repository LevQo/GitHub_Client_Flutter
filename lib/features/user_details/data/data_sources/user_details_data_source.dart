import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:github_client_flutter/features/user_details/data/models/user_details_model.dart';
import 'package:injectable/injectable.dart';

abstract class UserDetailsDataSource {
  Future<UserDetailsModel> getUserDetails(String username);
}

@LazySingleton(as: UserDetailsDataSource)
class UserDetailsDataSourceImpl implements UserDetailsDataSource {
  final Dio client;

  UserDetailsDataSourceImpl({@required this.client});

  @override
  Future<UserDetailsModel> getUserDetails(String username) async {
    return await client.get('/users/$username').then(_handleSuccess).catchError(_handleError);
  }

  UserDetailsModel _handleSuccess(Response response) => UserDetailsModel.fromJson(response.data);

  Future<UserDetailsModel> _handleError(e) async => Future.error(ServerException(message: e.parseMessage));
}
