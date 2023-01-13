import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String newsId,
      sourceName,
      authorName,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      dateToShow,
      content,
      readingTimeText;

  const NewsEntity({
    required this.newsId,
    required this.sourceName,
    required this.authorName,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.dateToShow,
    required this.readingTimeText,
  });

  @override
  List<Object?> get props => [
        newsId,
        sourceName,
        authorName,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        dateToShow,
        content,
        readingTimeText
      ];
}
