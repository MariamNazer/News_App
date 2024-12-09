import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_grid.dart';
import 'package:news_app/categories/category_details.dart';
import 'package:news_app/drower/home_drower.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrowerItems selectedDrowerItem = DrowerItems.categories;
  CategoryModel? selectedCategory;
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
          title: Text(
            selectedCategory != null
                ? selectedCategory!.name
                : selectedDrowerItem == DrowerItems.categories
                    ? 'News App'
                    : 'Settings',
          ),
        ),
        drawer: HomeDrower(
          height: height,
          width: width,
          onItemSelected: onDrowerItemSelecteg,
        ),
        body: selectedCategory != null
            ? CategoryDetails(catygoryId: selectedCategory!.id)
            : selectedDrowerItem == DrowerItems.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingsTab(),
      ),
    );
  }

  void onDrowerItemSelecteg(DrowerItems item) {
    selectedDrowerItem = item;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
