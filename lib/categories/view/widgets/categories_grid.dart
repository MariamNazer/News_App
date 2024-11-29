import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/categories/view/widgets/category_item.dart';
import 'package:news_app/categories/data/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  final void Function(CategoryModel) onCategorySelected;

  const CategoriesGrid({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          id: 'sports', name: 'Sports', imageName: 'ball', color: AppTheme.red),
      CategoryModel(
          id: 'business',
          name: 'Bussines',
          imageName: 'bussines',
          color: AppTheme.red),
      CategoryModel(
          id: 'sports', name: 'Sports', imageName: 'ball', color: AppTheme.red),
      CategoryModel(
          id: 'business',
          name: 'Bussines',
          imageName: 'bussines',
          color: AppTheme.red),
      CategoryModel(
          id: 'sports', name: 'Sports', imageName: 'ball', color: AppTheme.red),
      CategoryModel(
          id: 'business',
          name: 'Bussines',
          imageName: 'bussines',
          color: AppTheme.red),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
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
