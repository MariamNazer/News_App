import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/tabs/sources_tabs.dart';
import 'package:news_app/widgets/loading_indecator.dart';

class CategoryDetails extends StatelessWidget {
  final String catygoryId;
  const CategoryDetails({required this.catygoryId, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApIService.getSources(catygoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data?.status != 'ok') {
          return const LoadingIndecator();
        } else if (snapshot.hasError) {
          return const LoadingIndecator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourcesTabs(
            sources,
          );
        }
      },
    );
  }
}
