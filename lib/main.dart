import 'package:flutter/material.dart';
import 'package:news/data/repository/theme_repository_impl.dart';
import 'package:news/domain/use_cases/theme/get_theme_usecase.dart';
import 'package:news/presentation/navigation/app_router.dart';
import 'package:news/presentation/providers/theme_provider.dart';
import 'package:news/presentation/resources/theme_export.dart';
import 'package:news/presentation/screens/home.dart';
import 'package:provider/provider.dart';

import 'data/data_sources/local_sources/local_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();
  GetThemeUsecase getThemeUsecase = GetThemeUsecase(
      themeRepository: ThemeRepositoryImpl(themeLocalData: ThemeLocalData()));

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme = await getThemeUsecase.call();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child:
          Consumer<ThemeProvider>(builder: (context, themeChangeProvider, ch) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News',
          theme: themeData(themeChangeProvider.getDarkTheme, context),
          onGenerateRoute: AppRouter.generateRoute,
        );
      }),
    );
  }
}
