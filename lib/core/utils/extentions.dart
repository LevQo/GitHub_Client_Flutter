import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension GetScreenSize on BuildContext {
  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }
}

extension ParseException on Exception {
  String get parseMessage {
    String errorMessage = 'Something went wrong...';
    final e = this;
    if (e is DioError) {
      final statusCode = e.response?.statusCode;
      if (statusCode == 500) {
        errorMessage = 'Server connection error';
      }
    }
    return errorMessage;
  }
}
