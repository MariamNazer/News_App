import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/home/view/screens/home_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NewsApp',
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
        },
        initialRoute: HomeScreen.routeName,
        theme: AppTheme.LightTeme,
        themeMode: ThemeMode.light);
  }
}
