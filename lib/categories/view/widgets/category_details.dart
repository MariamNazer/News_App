import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/widgets/error_indecator.dart';
import 'package:news_app/souces/view/widgets/sources_tabs.dart';
import 'package:news_app/shared/widgets/loading_indecator.dart';
import 'package:news_app/souces/view_model/sorces_view_model.dart';
import 'package:news_app/souces/view_model/sources_states.dart';

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
    return BlocProvider(//ال blocprovider بيعمل close تلقائي لل streame اول هروح ل widget تانية
        create: (_) => viewModel,
        child: BlocBuilder<SorcesViewModel, SourcesStates>(builder: (_, state) {
          //عشان اعرف object من ال blocprovider واعمل listen عليه :
          //final viewModel = BlocProvider.of<SorcesViewModel>(context);
          //او context.read<SorcesViewModel>();
          if (state is GetSourcesLouding) {
            return const LoadingIndecator();
          } else if (state is GetSourcesError) {
            return ErrorIndecator(state.errormessage);
          } else if (state is GetSourcesSuccess) {
            return SourcesTabs(state.sources);
          } else {
            return const SizedBox();
          }
        }));
  }
}
