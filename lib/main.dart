import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/data_sources/remoute_sources/remote_data.dart';
import 'package:news/data/repository/news_repository_impl.dart';
import 'package:news/data/repository/theme_repository_impl.dart';
import 'package:news/domain/use_cases/news/get_all_news_usecase.dart';
import 'package:news/domain/use_cases/theme/get_theme_usecase.dart';
import 'package:news/presentation/bloc/news/news_bloc.dart';
import 'package:news/presentation/navigation/app_router.dart';
import 'package:news/presentation/providers/theme_provider.dart';
import 'package:news/presentation/resources/theme_export.dart';
import 'package:provider/provider.dart';
import 'package:news/presentation/di/injector.dart' as di;

import 'data/data_sources/local_sources/local_data.dart';

void main() async {
  await di.init();
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
        return MultiBlocProvider(
          providers: [
            BlocProvider<NewsBloc>(
              create: (context) => di.sl<NewsBloc>()
                ..add(
                  const LoadNewsEvent(page: 1, sortBy: 'popularity'),
                ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News',
            theme: themeData(themeChangeProvider.getDarkTheme, context),
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      }),
    );
  }
}
