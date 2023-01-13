import 'package:flutter/material.dart';

abstract class AppStyles {
  AppStyles._();

  static const TextStyle primaryW600Style24 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
  );

  static TextStyle normalTextStyle14([Color color = Colors.white]) =>
      TextStyle(color: color, fontSize: 14);
}
