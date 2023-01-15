part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState {
  NewsLoadingState();
}

class NewsLoadedState extends NewsState {
  final List<NewsEntity> news;
  final int page;
  final String sortBy;
  NewsLoadedState({
    required this.news,
    required this.page,
    required this.sortBy,
  });

  @override
  List<Object> get props => [news, page, sortBy];
}
