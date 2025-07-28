import 'package:fin_wise/application/navigation/controller/navigation_controller.dart';
import 'package:fin_wise/config/constants/assets.dart';
import 'package:fin_wise/config/router/app_routes.dart';
import 'package:fin_wise/core/di/service_locator.dart';
import 'package:fin_wise/core/navigation/navigation_service_impl.dart';
import 'package:fin_wise/presentation/widgets/app_bar_icon_btn.dart';
import 'package:fin_wise/presentation/widgets/fin_wise_app_bar.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FinWiseAppBar(
        centerTitle: true,
        showBackButton: true,
        onBackTap: () {
          sl<NavigationController>().changeIndex(0);
          NavigationServiceImpl().goNamed(AppRoutes.home.name);
        },
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          AppBarIconBtn(
            onTap: () {
              NavigationServiceImpl().goNamed(AppRoutes.notifications.name);
            },
            iconAsset: Assets.iconsNotificationsSVG.reminder,
          ),
        ],
      ),
    );
  }
}
