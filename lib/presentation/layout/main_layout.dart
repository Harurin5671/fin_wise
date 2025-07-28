import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:fin_wise/core/di/service_locator.dart';
import 'package:fin_wise/config/router/app_routes.dart';
import 'package:fin_wise/core/navigation/navigation_service_impl.dart';
import 'package:fin_wise/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:fin_wise/application/navigation/controller/navigation_controller.dart';

enum BottomNavItem { home, analysis, transactions, categories, profile }

final bottomNavItems = <BottomNavItem, String>{
  BottomNavItem.home: AppRoutes.home.name,
  BottomNavItem.analysis: AppRoutes.analysis.name,
  BottomNavItem.transactions: AppRoutes.transaction.name,
  BottomNavItem.categories: AppRoutes.categories.name,
  BottomNavItem.profile: AppRoutes.profile.name,
};

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).state.matchedLocation;
    log(location, name: 'location - main_layout.dart');
    final showBottomBar =
        location.contains(AppRoutes.home.path) ||
        location.contains(AppRoutes.notifications.path) ||
        location.contains(AppRoutes.analysis.path) ||
        location.contains(AppRoutes.transaction.path) ||
        location.contains(AppRoutes.categories.path) ||
        location.contains(AppRoutes.profile.path);
    final navigationController = sl<NavigationController>();

    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: showBottomBar
          ? StreamBuilder<int>(
              stream: navigationController.indexStream,
              initialData: navigationController.currentIndex,
              builder: (context, snapshot) {
                final index = snapshot.data ?? 0;

                return AppBottomNavBar(
                  currentIndex: index,
                  onTap: (i) {
                    final item = BottomNavItem.values[i];
                    navigationController.changeIndex(i);
                    NavigationServiceImpl().goNamed(bottomNavItems[item]!);
                  },
                );
              },
            )
          : null,
    );
  }
}
