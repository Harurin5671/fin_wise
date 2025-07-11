import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.caribbeanGreen,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.caribbeanGreen),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.lightGreen,
  ),
);
