import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class LoadingIndecator extends StatelessWidget {
  const LoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppTheme.primary,
    ));
  }
}
