import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarIconBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String iconAsset;
  final Color backgroundColor;
  final Color iconColor;
  final EdgeInsets padding;

  const AppBarIconBtn({
    super.key,
    required this.onTap,
    required this.iconAsset,
    this.backgroundColor = AppColors.lightGreen,
    this.iconColor = AppColors.darkGreen,
    this.padding = const EdgeInsets.only(right: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: SvgPicture.asset(
              iconAsset,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
