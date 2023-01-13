import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news/const.dart';
import 'package:news/data/models/news_model.dart';

class NewsRemoteData {
  Future<List<NewsModel>> getAllNews(
      {required int page, required String sortBy}) async {
    try {
      var uri = Uri.https("newsapi.org", "v2/everything", {
        "q": "bitcoin",
        "pageSize": "5",
        "domains": "techcrunch.com",
        "page": page.toString(),
        "sortBy": sortBy
      });
      var response = await http.get(
        uri,
        headers: {"X-Api-key": apiKey},
      );

      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw HttpException(data['code']);
      }
      for (var v in data["articles"]) {
        newsTempList.add(v);
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }
}
