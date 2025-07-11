import 'package:go_router/go_router.dart';

import 'package:fin_wise/config/router/app_routes.dart';
import 'package:fin_wise/presentation/pages/home/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home.path,
  routes: [
    GoRoute(
      name: AppRoutes.home.name,
      path: AppRoutes.home.path,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
