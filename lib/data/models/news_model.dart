// ignore_for_file: overridden_fields, annotate_overrides

import 'package:news/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
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

  const NewsModel({
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
  }) : super(
            newsId: newsId,
            sourceName: sourceName,
            authorName: authorName,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            dateToShow: dateToShow,
            content: content,
            readingTimeText: readingTimeText);

  factory NewsModel.fromJson(dynamic json) {
    String title = json["title"] ?? "";
    String content = json["content"] ?? "";
    String description = json["description"] ?? "";
    String dateToShow = "";

    return NewsModel(
        newsId: json["source"]["id"] ?? "",
        sourceName: json["source"]["name"] ?? "",
        authorName: json["author"] ?? "",
        title: title,
        description: description,
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ??
            "https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1",
        publishedAt: json["publishedAt"] ?? "",
        content: content,
        dateToShow: dateToShow,
        readingTimeText: '');
  }

  static List<NewsModel> newsFromSnapshot(List newSnapshot) {
    return newSnapshot.map((json) {
      return NewsModel.fromJson(json);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["newsId"] = newsId;
    data["sourceName"] = sourceName;
    data["authorName"] = authorName;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["dateToShow"] = dateToShow;
    data["content"] = content;
    data["readingTimeText"] = readingTimeText;
    return data;
  }
}
