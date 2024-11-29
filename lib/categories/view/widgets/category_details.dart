import 'package:flutter/material.dart';
import 'package:news_app/shared/widgets/error_indecator.dart';
import 'package:news_app/souces/view/widgets/sources_tabs.dart';
import 'package:news_app/shared/widgets/loading_indecator.dart';
import 'package:news_app/souces/view_model/sorces_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final String catygoryId;
  const CategoryDetails({required this.catygoryId, super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SorcesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.catygoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => viewModel,
        child: Consumer<SorcesViewModel>(builder: (_, viewModle, __) {
          if (viewModle.isLoding) {
            return const LoadingIndecator();
          } else if (viewModle.errormessage != null) {
            return ErrorIndecator(viewModle.errormessage!);
          } else {
            return SourcesTabs(viewModle.sources);
          }
        }));
  }
}
