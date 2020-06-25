import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CoreModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.add(LogInterceptor(responseBody: true))
    ..options.baseUrl = 'https://api.github.com';

  @lazySingleton
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();
}
