import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/tabs/sources_tabs.dart';

class CategoryDetails extends StatefulWidget {
  String catygoryId;
  CategoryDetails({super.key, required this.catygoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Source> sources =
      List.generate(10, (index) => Source(name: 'source $index', id: '$index'));
  @override
  Widget build(BuildContext context) {
    return SourcesTabs(
      source: sources,
    );
  }
}
