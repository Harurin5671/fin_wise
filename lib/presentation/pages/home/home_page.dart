import 'dart:developer';

import 'package:fin_wise/config/constants/assets.dart';
import 'package:fin_wise/config/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home,
      Icons.analytics,
      Icons.swap_horiz,
      Icons.layers,
      Icons.person,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola, Bienvenido de nuevo',
              style: FontStyles.poppinsSemiBold.copyWith(
                fontSize: 20,
                color: Color(0xFF052224),
              ),
            ),
            Text(
              'Good Morning',
              style: FontStyles.poppinsRegular.copyWith(
                fontSize: 14,
                color: Color(0xFF052224),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFDFF7E2),
              ),
              child: Icon(
                Icons.notifications_none_rounded,
                color: Color(0xFF093030),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              log('Home');
              break;
            case 1:
              log('Analysis');
              break;
            case 2:
              log('Transaction');
              break;
            case 3:
              log('Category');
              break;
            case 4:
              log('Profile');
              break;
          }
        },
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
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
        color: const Color(0xFFDFF7E2), // fondo general del nav
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = index == currentIndex;

            return GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 11,
                ),
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF00D09E)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SvgPicture.asset(
                  width: 25,
                  height: 31,
                  fit: BoxFit.scaleDown,
                  icons[index],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
