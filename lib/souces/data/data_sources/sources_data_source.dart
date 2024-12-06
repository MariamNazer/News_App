import 'package:news_app/souces/data/models/source.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSources(String categoryId);
}
