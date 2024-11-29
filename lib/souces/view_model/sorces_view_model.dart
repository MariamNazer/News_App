import 'package:flutter/material.dart';
import 'package:news_app/souces/data/models/source.dart';
import 'package:news_app/souces/data/data_sources/sources_data_source.dart';

class SorcesViewModel with ChangeNotifier {
  final dataSource = SourcesDataSource();
  List<Source> sources = [];
  String? errormessage;
  bool isLoding = false;
  Future<void> getSources(String categoryID) async {
    isLoding = true;
    notifyListeners();
    try {
      final response = await dataSource.getSources(categoryID);
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources!;
      } else {
        errormessage = 'Failed to get sources';
      }
    } catch (error) {
      errormessage = error.toString();
    }
    isLoding = false;
    notifyListeners();
  }
}
