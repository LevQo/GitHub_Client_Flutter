import 'package:flutter/material.dart';

extension GetScreenSize on BuildContext {
  double get screenWidth{
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight{
    return MediaQuery.of(this).size.height;
  }
}