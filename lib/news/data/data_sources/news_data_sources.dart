import 'dart:convert';

import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/shared/api_constant.dart';
import 'package:http/http.dart' as http;

class NewsDataSources {
   Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(
      ApiConstant.baseURL,
      ApiConstant.newsEndPoint,
      {'apiKey': ApiConstant.apiKey, 'sources': sourceId},
    );
    final response = await http.get(uri);
    //عملتله ديكود عشان هو هيرجعلي string ودا مينفعش فحولته ل json
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
