import 'package:news/domain/repository/theme_repository.dart';

class SetDarkThemeUsecase {
  final ThemeRepository themeRepository;

  SetDarkThemeUsecase({required this.themeRepository});

  Future<void> call(bool value) => themeRepository.setDarkTheme(value);
}
