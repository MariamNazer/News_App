import 'package:news_app/souces/data/data_sources/sources_data_source.dart';
import 'package:news_app/souces/data/models/source.dart';

class SourcesFirebaseDataSources extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    // firebase logic
    return [];
  }
}
