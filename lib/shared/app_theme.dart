import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF39A552);
  static const Color black = Color(0xFF303030);
  static const Color navy = Color(0xFF4F5A69);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF79828B);
  static const Color red = Color(0xFFC91C22);

  // ignore: non_constant_identifier_names
  static ThemeData LightTeme = ThemeData(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(
          color: primary,
          foregroundColor: white,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w400, color: white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)))),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: white),
          titleSmall: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: black)));
}
