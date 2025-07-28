import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:fin_wise/config/theme/font_styles.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.caribbeanGreen,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.caribbeanGreen,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.honeyDew),
  ),
  textTheme: GoogleFonts.poppinsTextTheme()
      .apply(
        bodyColor: AppColors.fenceGreen,
        displayColor: AppColors.fenceGreen,
      )
      .copyWith(
        titleLarge: FontStyles.poppins.title.copyWith(
          color: AppColors.fenceGreen,
        ),
        bodyMedium: FontStyles.poppins.paragraph.copyWith(
          color: AppColors.fenceGreen,
        ),
        titleMedium: FontStyles.poppins.subtitle.copyWith(
          color: AppColors.fenceGreen,
        ),
        bodySmall: FontStyles.poppins.subtext.copyWith(
          color: AppColors.fenceGreen,
        ),
      ),
);
