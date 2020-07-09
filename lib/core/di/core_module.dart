import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const baseUrl = 'https://api.github.com';

@module
abstract class CoreModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.add(LogInterceptor(responseBody: true))
    ..options.baseUrl = baseUrl;

  @lazySingleton
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();
}
