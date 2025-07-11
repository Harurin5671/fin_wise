import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:fin_wise/config/constants/assets.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      Assets.iconsNavBarSVG.home,
      Assets.iconsNavBarSVG.analysis,
      Assets.iconsNavBarSVG.transaction,
      Assets.iconsNavBarSVG.category,
      Assets.iconsNavBarSVG.profile,
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(70),
      child: Container(
        height: 108,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        color: const Color(0xFFDFF7E2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = index == currentIndex;

            return GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutCubic,
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 18 : 12,
                  vertical: isSelected ? 13 : 11,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF00D09E)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: isSelected ? 1.1 : 1.0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isSelected ? 1.0 : 0.8,
                    child: SvgPicture.asset(
                      width: 25,
                      height: 31,
                      fit: BoxFit.scaleDown,
                      icons[index],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
