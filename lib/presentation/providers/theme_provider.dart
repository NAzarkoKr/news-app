import 'package:flutter/material.dart';
import 'package:news/data/data_sources/local_sources/local_data.dart';
import 'package:news/data/repository/theme_repository_impl.dart';
import 'package:news/domain/use_cases/use_cases.dart';

class ThemeProvider with ChangeNotifier {
  SetDarkThemeUsecase setDarkThemeUsecase = SetDarkThemeUsecase(
      themeRepository: ThemeRepositoryImpl(themeLocalData: ThemeLocalData()));
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    setDarkThemeUsecase.call(value);
    notifyListeners();
  }
}
