import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:fin_wise/config/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.fenceGreen,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.fenceGreen,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.honeyDew),
  ),
  textTheme: GoogleFonts.poppinsTextTheme()
      .apply(bodyColor: AppColors.honeyDew, displayColor: AppColors.honeyDew)
      .copyWith(
        titleLarge: FontStyles.poppins.title.copyWith(
          color: AppColors.honeyDew,
        ),
        bodyMedium: FontStyles.poppins.paragraph.copyWith(
          color: AppColors.honeyDew,
        ),
        titleMedium: FontStyles.poppins.subtitle.copyWith(
          color: AppColors.honeyDew,
        ),
        bodySmall: FontStyles.poppins.subtext.copyWith(
          color: AppColors.honeyDew,
        ),
      ),
);
