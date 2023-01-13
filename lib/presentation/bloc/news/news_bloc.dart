import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/domain/entities/news_entity.dart';
import 'package:news/domain/use_cases/news/get_all_news_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetAllNewsUsecase getAllNewsUsecase;
  NewsBloc({required this.getAllNewsUsecase}) : super(NewsLoadingState()) {
    on<LoadNewsEvent>(_onLoadNews);
  }

  FutureOr<void> _onLoadNews(LoadNewsEvent event, Emitter emit) async {
    try {
      final newsList =
          await getAllNewsUsecase.call(page: event.page, sortBy: event.sortBy);
      emit(NewsLoadedState(news: newsList));
    } catch (_) {
      print('Error');
    }
  }
}
