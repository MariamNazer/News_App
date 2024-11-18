import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  CategoryModel categories;

  CategoryItem({required this.index, required this.categories});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: categories.color,
          borderRadius: BorderRadiusDirectional.only(
              topStart: const Radius.circular(25),
              topEnd: const Radius.circular(25),
              bottomStart: index % 2 == 0
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              bottomEnd: index % 2 == 0
                  ? const Radius.circular(0)
                  : const Radius.circular(25))),
      child: Padding(
        padding: EdgeInsets.all(width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child:
                    Image.asset('assets/images/${categories.imageName}.png')),
            Expanded(
              flex: 1,
              child: Text(
                categories.name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
