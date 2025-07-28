import 'package:fin_wise/presentation/pages/analysis/analysis_page.dart';
import 'package:fin_wise/presentation/pages/categories/categories_page.dart';
import 'package:fin_wise/presentation/pages/profile/profile_page.dart';
import 'package:fin_wise/presentation/pages/transaction/transaction_page.dart';
import 'package:go_router/go_router.dart';

import 'package:fin_wise/config/router/app_routes.dart';
import 'package:fin_wise/presentation/layout/main_layout.dart';
import 'package:fin_wise/presentation/pages/home/home_page.dart';
import 'package:fin_wise/presentation/pages/notifications/notifications_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          name: AppRoutes.home.name,
          path: AppRoutes.home.path,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          name: AppRoutes.notifications.name,
          path: AppRoutes.notifications.path,
          builder: (context, state) => const NotificationsPage(),
        ),
        GoRoute(
          name: AppRoutes.analysis.name,
          path: AppRoutes.analysis.path,
          builder: (context, state) => const AnalysisPage(),
        ),
        GoRoute(
          name: AppRoutes.transaction.name,
          path: AppRoutes.transaction.path,
          builder: (context, state) => const TransactionPage(),
        ),
        GoRoute(
          name: AppRoutes.categories.name,
          path: AppRoutes.categories.path,
          builder: (context, state) => const CategoriesPage(),
        ),
        GoRoute(
          name: AppRoutes.profile.name,
          path: AppRoutes.profile.path,
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);
