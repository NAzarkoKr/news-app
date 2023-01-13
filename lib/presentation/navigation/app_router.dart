import 'package:clean_arch_structure/presentation/navigation/app_routes.dart';
import 'package:clean_arch_structure/presentation/screens/home.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case AppRoutes.main:
        return MaterialPageRoute(
            builder: (context) => const MyHomePage(), settings: settings);

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() => MaterialPageRoute(
        builder: (context) => Container(),
      );
}