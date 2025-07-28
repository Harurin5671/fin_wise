import 'package:flutter/material.dart';

import 'package:fin_wise/core/utils/date_utils.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/summary_card.dart';
import 'package:fin_wise/config/constants/assets.dart';
import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:fin_wise/config/router/app_routes.dart';
import 'package:fin_wise/config/theme/app_text_styles.dart';
import 'package:fin_wise/presentation/widgets/fin_wise_app_bar.dart';
import 'package:fin_wise/presentation/widgets/app_bar_icon_btn.dart';
import 'package:fin_wise/core/navigation/navigation_service_impl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final greeting = getGreeting();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: FinWiseAppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola, Bienvenido de nuevo',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              greeting,
              style: AppTextStyles.of(context).subtextLeagueSpartan,
            ),
          ],
        ),
        actions: [
          AppBarIconBtn(
            onTap: () {
              NavigationServiceImpl().pushNamed(AppRoutes.notifications.name);
            },
            iconAsset: Assets.iconsNotificationsSVG.reminder,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 41),
          const SummaryCard(),
          const SizedBox(height: 32),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(70),
              ),
              child: Container(
                width: double.infinity,
                color: isDarkMode ? AppColors.darkGreen : AppColors.honeyDew,
                padding: const EdgeInsets.only(
                  left: 37,
                  right: 37,
                  top: 33,
                  bottom: 120,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: 152,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(31),
                      //     color: AppColors.caribbeanGreen,
                      //   ),
                      // ),
                      Container(
                        height: 152,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(31),
                          color: AppColors.caribbeanGreen,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // --- Columna Izquierda ---
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Círculo de progreso con el ícono de carro
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 64,
                                      height: 64,
                                      child: CircularProgressIndicator(
                                        value: 0.5,
                                        strokeWidth: 3,
                                        backgroundColor: AppColors.honeyDew,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              AppColors.oceanBlue,
                                            ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      Assets.iconsSvg.car,
                                      width: 25,
                                      height: 25,
                                      colorFilter: ColorFilter.mode(
                                        AppColors.fenceGreen,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Savings\nOn Goals',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: AppColors.voidColor,
                                      ),
                                ),
                              ],
                            ),

                            const SizedBox(width: 16),
                            // --- Línea divisoria vertical ---
                            Container(
                              width: 2,
                              height: double.infinity,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                            const SizedBox(width: 16),

                            // --- Columna Derecha ---
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Revenue
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.iconsSvg.salary,
                                        width: 24,
                                        height: 24,
                                        // color: AppColors.voidColor,
                                        colorFilter: ColorFilter.mode(
                                          AppColors.voidColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Revenue Last Week',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: AppColors.voidColor,
                                                ),
                                          ),
                                          Text(
                                            '\$4,000.00',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 16,
                                                  color: AppColors.voidColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    height: 1,
                                    color: Colors.white.withValues(alpha: 0.7),
                                  ),
                                  const SizedBox(height: 16),
                                  // Food
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.iconsSvg.food,
                                        width: 24,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(
                                          AppColors.voidColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Food Last Week',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: AppColors.fenceGreen,
                                                ),
                                          ),
                                          Text(
                                            '-\$100.00',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 16,
                                                  color: AppColors.oceanBlue,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text('Hola, Bienvenido de nuevo'),
                      // SizedBox(height: 20),
                      // Text('Hola, Bienvenido de nuevo'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
