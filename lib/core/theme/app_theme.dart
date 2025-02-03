import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData darktheme = ThemeData(
      primaryColor: AppColors.coffe,
      primaryColorDark: AppColors.black,
      primaryColorLight: AppColors.white,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(color: AppColors.white, fontSize: 14),
      ),
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        titleTextStyle: TextStyle(color: AppColors.coffe, fontSize: 24),
        iconTheme: IconThemeData(
          color: AppColors.coffe,
        ),
        centerTitle: true,
      ));
}
