import 'package:news/domain/entities/news_entity.dart';
import 'package:news/domain/repository/news_repository.dart';

class GetAllNewsUsecase {
  final NewsRepository newsRepository;

  GetAllNewsUsecase({required this.newsRepository});

  Future<List<NewsEntity>> call({required int page, required String sortBy}) =>
      newsRepository.getAllNews(page, sortBy);
}
