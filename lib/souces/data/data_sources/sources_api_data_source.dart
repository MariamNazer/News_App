import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/shared/api_constant.dart';
import 'package:news_app/souces/data/data_sources/sources_data_source.dart';
import 'package:news_app/souces/data/models/source.dart';
import 'package:news_app/souces/data/models/source_resspond.dart';

class SourcesAPIDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiConstant.baseURL,
      ApiConstant.sourcesEndPoint,
      {'apiKey': ApiConstant.apiKey, 'category': categoryId},
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourceResponse = SourceResspond.fromJson(json);
    if (sourceResponse.status == 'ok' && sourceResponse.sources != null) {
      return sourceResponse.sources!;
    } else {
      // هنا انا في حالة حصل مشكلة ورجع empty list هعمل exeption وهعمله catch فالحتة اللي هنادي فيها ال method
      throw Exception('Failed to get sources');
    }
  }
}
