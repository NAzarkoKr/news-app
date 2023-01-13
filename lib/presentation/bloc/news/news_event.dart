part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsEvent extends NewsEvent {
  final int page;
  final String sortBy;
  const LoadNewsEvent({
    required this.page,
    required this.sortBy,
  });

  @override
  List<Object> get props => [page, sortBy];
}
