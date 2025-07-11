import 'dart:developer';

import 'package:fin_wise/config/constants/assets.dart';
import 'package:fin_wise/config/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
