import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class HomeDrower extends StatelessWidget {
  double height;
  double width;
  void Function(DrowerItems) onItemSelected;
  HomeDrower(
      {required this.height,
      required this.width,
      required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLargeStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24);
    return SizedBox(
      width: width * 0.7,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            width: double.infinity,
            height: height * 0.252,
            alignment: Alignment.center,
            child: Text('News App!', style: titleLargeStyle),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(
                  top: height * 0.02, start: width * 0.03),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      onItemSelected(DrowerItems.categories);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.menu),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text(
                          'Category',
                          style:
                              titleLargeStyle?.copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      onItemSelected(DrowerItems.settings);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text(
                          'Settings',
                          style:
                              titleLargeStyle?.copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrowerItems { categories, settings }
