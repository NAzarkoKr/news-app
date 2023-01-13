import 'package:news/data/data_sources/local_sources/local_data.dart';
import 'package:news/domain/repository/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalData themeLocalData;

  ThemeRepositoryImpl({required this.themeLocalData});

  @override
  Future<bool> getTheme() async => themeLocalData.getTheme();

  @override
  Future<void> setDarkTheme(bool value) async =>
      themeLocalData.setDarkTheme(value);
}
