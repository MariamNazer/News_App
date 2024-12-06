import 'package:flutter/material.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/repositories/source_repository.dart';
import 'package:news_app/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  late final SourceRepository repository;
  NewsViewModel() {
    repository = SourceRepository(ServiceLocator.newsDataSource);
  }
  List<News> newsList = [];
  String? errormessage;
  bool isLoding = false;
  Future<void> getNews(String sourceId) async {
    isLoding = true;
    notifyListeners();
    try {
      newsList = await repository.getNews(sourceId);
    } catch (error) {
      errormessage = error.toString();
    }
    isLoding = false;
    notifyListeners();
  }
}
