import 'dart:developer';

import 'package:fin_wise/application/navigation/controller/navigation_controller.dart';
import 'package:fin_wise/config/router/app_routes.dart';
import 'package:fin_wise/core/di/service_locator.dart';
import 'package:fin_wise/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).state.matchedLocation;
    log(location, name: 'location - main_layout.dart');
    final showBottomBar = location.contains(AppRoutes.home.path);
    final navigationController = sl<NavigationController>();

    return Scaffold(
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
                    navigationController.changeIndex(i);
                    switch (i) {
                      case 0:
                        log('home');
                        break;
                      case 1:
                        // context.go(AppRoutes.analysis.path);
                        log('analysis');
                        break;
                      case 2:
                        // context.go(AppRoutes.transactions.path);
                        log('transactions');
                        break;
                      case 3:
                        // context.go(AppRoutes.categories.path);
                        log('categories');
                        break;
                      case 4:
                        log('profile');
                        break;
                    }
                  },
                );
              },
            )
          : null,
    );
  }
}
