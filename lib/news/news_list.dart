import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/widgets/loading_indecator.dart';

class NewsList extends StatelessWidget {
  final String sourceId;
  const NewsList(this.sourceId, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApIService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndecator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const LoadingIndecator();
        } else {
          final newsList = snapshot.data?.news ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(newsList[index]),
            itemCount: newsList.length,
          );
        }
      },
    );
  }
}
