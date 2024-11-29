import 'package:flutter/material.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/widgets/loading_indecator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  final String sourceId;
  const NewsList(this.sourceId, {super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoding) {
            return const LoadingIndecator();
          } else if (viewModel.errormessage != null) {
            return Center(child: Text(viewModel.errormessage!));
          } else {
            return ListView.builder(
              itemBuilder: (_, index) => NewsItem(viewModel.newsList[index]),
              itemCount: viewModel.newsList.length,
            );
          }
        },
      ),
    );
  }
}
