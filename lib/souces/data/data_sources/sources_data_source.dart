import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/shared/api_constant.dart';
import 'package:news_app/souces/data/models/source_resspond.dart';

class SourcesDataSource {
  Future<SourceResspond> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiConstant.baseURL,
      ApiConstant.sourcesEndPoint,
      {'apiKey': ApiConstant.apiKey, 'category': categoryId},
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourceResspond.fromJson(json);
  }
}