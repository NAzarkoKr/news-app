import 'package:flutter/material.dart';
import 'package:news/presentation/resources/app_colors.dart';

ThemeData themeData(bool isDarkTheme, BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: isDarkTheme
        ? AppColors.darkScaffoldColor
        : AppColors.lightScaffoldColor,
    primaryColor:
        isDarkTheme ? AppColors.darkCardColor : AppColors.lightCardColor,
    backgroundColor: isDarkTheme
        ? AppColors.darkBackgroundColor
        : AppColors.lightBackgroundColor,
    hintColor: isDarkTheme ? Colors.grey.shade400 : Colors.grey.shade700,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: isDarkTheme ? Colors.white : Colors.black,
      selectionColor: Colors.blue,

      // selectionHandleColor: Colors.blue,
    ),
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: isDarkTheme ? Colors.white : Colors.black,
          displayColor: isDarkTheme ? Colors.white : Colors.black,
        ),
    cardColor: isDarkTheme ? AppColors.darkCardColor : AppColors.lightCardColor,
    brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: isDarkTheme
              ? AppColors.darkIconsColor
              : AppColors.lightIconsColor,
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        ),
  );
}
