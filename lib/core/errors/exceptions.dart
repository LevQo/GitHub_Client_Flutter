import 'package:flutter/material.dart';

class ServerException implements Exception {
  final String message;

  const ServerException({@required this.message});
}

class CacheException implements Exception {
  final String message;

  const CacheException({@required this.message});
}
