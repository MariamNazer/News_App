import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_sources/news_data_sources.dart';
import 'package:news_app/news/data/models/news.dart';

class NewsViewModel with ChangeNotifier{
  final dataSource = NewsDataSources();
  List<News> newsList = [];
  String? errormessage;
  bool isLoding = false;
  Future<void> getNews(String sourceId) async {
    isLoding = true;
    notifyListeners();
    try {
      final response = await dataSource.getNews(sourceId);
      if (response.status == 'ok' && response.news != null) {
        newsList = response.news!;
      } else {
        errormessage = 'Failed to get news';
      }
    } catch (error) {
      errormessage = error.toString();
    }
    isLoding = false;
    notifyListeners();
  }
}
