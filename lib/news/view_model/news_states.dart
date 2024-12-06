import 'package:news_app/news/data/models/news.dart';

abstract class NewsStates {}
class NewsInitial extends NewsStates{}
class GetNewsLoading extends NewsStates {}
class GetNewsSuccess extends NewsStates {
  final List<News> newsList ;
  GetNewsSuccess(this.newsList);
}
class GetNewsError extends NewsStates {
    final String errormessage;
  GetNewsError(this.errormessage);

}

