import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  final void Function(CategoryModel) onCategorySelected;

 const CategoriesGrid({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final categories = List.generate(
        6,
        (index) => CategoryModel(
            id: '$index',
            name: 'Sports',
            imageName: 'ball',
            color: AppTheme.red));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Text(
              'Pick your category of interest',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.navy),
            ),
          ),
          Expanded(
              //عملنا لل gridview wrap with expanded عشان اديها نفس طول ال column لانها ملهاش طول وال column ملهوش طول محدد فمينفعش يبقى فيه مجهولين
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24),
                  itemCount: categories.length,
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () => onCategorySelected(categories[index]),
                        child: CategoryItem(
                          index: index,
                          categories: categories[index],
                        ),
                      )))
        ],
      ),
    );
  }
}
