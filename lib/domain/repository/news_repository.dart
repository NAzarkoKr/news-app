import 'package:news/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getAllNews(int page, String sortBy);
}
