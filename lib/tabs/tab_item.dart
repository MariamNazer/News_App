import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class TabItem extends StatelessWidget {
  String sourceName;
  bool isSelected;
  TabItem({required this.sourceName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 2, color: AppTheme.primary),
        color: isSelected == true ? AppTheme.primary : Colors.transparent,
      ),
      child: Text(
        sourceName,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: isSelected == true ? AppTheme.white : AppTheme.primary),
      ),
    );
  }
}
