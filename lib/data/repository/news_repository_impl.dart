import 'package:news/data/data_sources/remoute_sources/remote_data.dart';
import 'package:news/domain/entities/news_entity.dart';
import 'package:news/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteData newsRemoteData;

  NewsRepositoryImpl({required this.newsRemoteData});
  @override
  Future<List<NewsEntity>> getAllNews(int page, String sortBy) async =>
      newsRemoteData.getAllNews(page: page, sortBy: sortBy);
}
