import 'package:dartz/dartz.dart';
import 'package:github_client_flutter/core/errors/failures.dart';

abstract class UseCase<Type, Params>{
  Future<Type> call(Params params);
}