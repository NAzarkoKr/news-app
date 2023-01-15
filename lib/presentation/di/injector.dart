import 'package:get_it/get_it.dart';
import 'package:news/data/data_sources/remoute_sources/remote_data.dart';
import 'package:news/data/repository/news_repository_impl.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:news/domain/use_cases/use_cases.dart';
import 'package:news/presentation/bloc/news/news_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => NewsBloc(getAllNewsUsecase: sl.call()));

  //usecases
  sl.registerLazySingleton(() => GetAllNewsUsecase(newsRepository: sl.call()));
  //repository
  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(newsRemoteData: NewsRemoteData()));
}
