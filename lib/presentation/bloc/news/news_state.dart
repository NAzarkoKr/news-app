part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<NewsEntity> news;
  const NewsLoadedState({
    required this.news,
  });

  @override
  List<Object> get props => [news];
}
