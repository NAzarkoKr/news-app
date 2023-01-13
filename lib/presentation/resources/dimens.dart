import 'package:flutter/material.dart';

abstract class AppDimension {
  AppDimension._();

  static const paddingValue20 = 20.0;

  static const EdgeInsets defaultHorizontalPadding20 =
      EdgeInsets.symmetric(horizontal: paddingValue20);
}
