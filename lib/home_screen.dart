import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_grid.dart';
import 'package:news_app/drower/home_drower.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          'News App',
        )),
        drawer:  HomeDrower(height: height,width: width),
        body: const CategoriesGrid(),
      ),
    );
  }
}
