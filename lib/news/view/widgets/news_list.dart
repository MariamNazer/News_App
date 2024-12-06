import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/news/view_model/news_states.dart';
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
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsStates>(
        builder: (_, state) {
          if (state is GetNewsLoading) {
            return const LoadingIndecator();
          } else if (state is GetNewsError) {
            return Center(child: Text(state.errormessage));
          } else if (state is GetNewsSuccess) {
            return ListView.builder(
              itemBuilder: (_, index) => NewsItem(state.newsList[index]),
              itemCount: state.newsList.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
