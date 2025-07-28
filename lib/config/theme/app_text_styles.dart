import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:fin_wise/config/theme/font_styles.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  final BuildContext context;
  final bool isDarkMode;

  AppTextStyles(this.context)
    : isDarkMode = Theme.of(context).brightness == Brightness.dark;

  Color get baseColor =>
      isDarkMode ? AppColors.lightGreen : AppColors.fenceGreen;

  // Atajo para aplicar color a cualquier estilo base
  TextStyle _withColor(TextStyle style) => style.copyWith(color: baseColor);

  /// Poppins
  TextStyle get titlePoppins => _withColor(FontStyles.poppins.title);
  TextStyle get paragraphPoppins => _withColor(FontStyles.poppins.paragraph);
  TextStyle get subtextPoppins => _withColor(FontStyles.poppins.subtext);
  TextStyle get subtitlePoppins => _withColor(FontStyles.poppins.subtitle);

  /// League Spartan
  TextStyle get titleLeagueSpartan =>
      _withColor(FontStyles.leagueSpartan.title);
  TextStyle get paragraphLeagueSpartan =>
      _withColor(FontStyles.leagueSpartan.paragraph);
  TextStyle get subtextLeagueSpartan =>
      _withColor(FontStyles.leagueSpartan.subtext);
  TextStyle get subtitleLeagueSpartan =>
      _withColor(FontStyles.leagueSpartan.subtitle);

  /// Inter
  TextStyle get titleInter => _withColor(FontStyles.inter.title);
  TextStyle get paragraphInter => _withColor(FontStyles.inter.paragraph);
  TextStyle get subtextInter => _withColor(FontStyles.inter.subtext);
  TextStyle get subtitleInter => _withColor(FontStyles.inter.subtitle);

  static AppTextStyles of(BuildContext context) => AppTextStyles(context);
}
