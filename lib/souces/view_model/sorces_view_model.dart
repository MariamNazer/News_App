import 'package:flutter/material.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/souces/repositories/sources_repository.dart';
import 'package:news_app/souces/data/models/source.dart';

class SorcesViewModel with ChangeNotifier {
  late final SourcesRepository repository;
  SorcesViewModel() {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }
  List<Source> sources = [];
  String? errormessage;
  bool isLoding = false;
  Future<void> getSources(String categoryID) async {
    isLoding = true;
    notifyListeners();
    try {
      sources = await repository.getSources(categoryID);
    } catch (error) {
      errormessage = error.toString();
    }
    isLoding = false;
    notifyListeners();
  }
}
