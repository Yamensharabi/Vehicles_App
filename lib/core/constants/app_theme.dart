import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData themeArabic = ThemeData(
    fontFamily: 'Readx Pro',
    splashColor: null,
    primarySwatch: null,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: AppColors.mainColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: AppColors.mainColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColors.mainColor,
      ),
      bodyLarge: TextStyle(
        color: AppColors.mainColor,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        decoration: TextDecoration.none,
      ),
      bodyMedium: TextStyle(
        color: AppColors.mainColor,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColors.mainColor,
        fontSize: 12,
      ),
    ),
    // primarySwatch: Colors.blue,
  );
}
