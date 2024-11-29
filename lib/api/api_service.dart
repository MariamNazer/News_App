import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/models/news_response/news_response.dart';
import 'package:news_app/models/source_resspond/source_resspond.dart';

class ApIService {
  static Future getSources(String categoryId) async {
    final uri = Uri.https(
      ApiConstant.baseURL,
      ApiConstant.sourcesEndPoint,
      {'apiKey': ApiConstant.apiKey, 'category': categoryId},
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourceResspond.fromJson(json);
  }

  static Future getNews(String sourceId) async {
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
