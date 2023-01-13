import 'package:news/domain/repository/theme_repository.dart';

class GetThemeUsecase {
  final ThemeRepository themeRepository;

  GetThemeUsecase({required this.themeRepository});

  Future<bool> call() => themeRepository.getTheme();
}
