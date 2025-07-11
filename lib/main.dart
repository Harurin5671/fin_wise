import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fin_wise/core/bootstrap.dart';
import 'package:fin_wise/config/theme/app_theme.dart';
import 'package:fin_wise/core/di/service_locator.dart';
import 'package:fin_wise/config/router/app_router.dart';
import 'package:fin_wise/application/navigation/cubit/nav_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Bootstrap.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<NavCubit>())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'FinWise',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
      ),
    );
  }
}
