import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/repositories/source_repository.dart';
import 'package:news_app/news/view_model/news_states.dart';
import 'package:news_app/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsStates> {
  late final SourceRepository repository;
  NewsViewModel() : super(NewsInitial()) {
    repository = SourceRepository(ServiceLocator.newsDataSource);
  }
  Future<void> getNews(String sourceId) async {
    GetNewsLoading();
    try {
      final newsList = await repository.getNews(sourceId);
      GetNewsSuccess(newsList);
    } catch (error) {
      GetNewsError(error.toString());
    }
  }
}
