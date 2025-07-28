import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/profile_avatar.dart';
import 'package:fin_wise/config/constants/assets.dart';
import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:fin_wise/core/di/service_locator.dart';
import 'package:fin_wise/config/router/app_routes.dart';
import 'package:fin_wise/presentation/widgets/app_bar_icon_btn.dart';
import 'package:fin_wise/presentation/widgets/fin_wise_app_bar.dart';
import 'package:fin_wise/core/navigation/navigation_service_impl.dart';
import 'package:fin_wise/application/navigation/controller/navigation_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: FinWiseAppBar(
        centerTitle: true,
        showBackButton: true,
        onBackTap: () {
          sl<NavigationController>().changeIndex(0);
          NavigationServiceImpl().goNamed(AppRoutes.home.name);
        },
        title: Text('Profile', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          AppBarIconBtn(
            onTap: () {
              NavigationServiceImpl().goNamed(AppRoutes.notifications.name);
            },
            iconAsset: Assets.iconsNotificationsSVG.reminder,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                const SizedBox(height: 55),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 130, left: 38),
                      color: isDarkMode
                          ? AppColors.darkGreen
                          : AppColors.honeyDew,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 57,
                                height: 53,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: AppColors.lightBlue,
                                ),
                                child: SvgPicture.asset(
                                  Assets.iconsProfileSVG.editProfile,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.honeyDew,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 13),
                              Text(
                                'Edit Profile',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 34),
                          Row(
                            children: [
                              Container(
                                width: 57,
                                height: 53,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Color(0xFF3299FF),
                                ),
                                child: SvgPicture.asset(
                                  Assets.iconsProfileSVG.security,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.honeyDew,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 13),
                              Text(
                                'Security',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 34),
                          Row(
                            children: [
                              Container(
                                width: 57,
                                height: 53,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: AppColors.oceanBlue,
                                ),
                                child: SvgPicture.asset(
                                  Assets.iconsProfileSVG.setting,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.honeyDew,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 13),
                              Text(
                                'Setting',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 34),
                          Row(
                            children: [
                              Container(
                                width: 57,
                                height: 53,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: AppColors.lightBlue,
                                ),
                                child: SvgPicture.asset(
                                  Assets.iconsProfileSVG.help,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.honeyDew,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 13),
                              Text(
                                'Help',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 34),
                          Row(
                            children: [
                              Container(
                                width: 57,
                                height: 53,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Color(0xFF3299FF),
                                ),
                                child: SvgPicture.asset(
                                  Assets.iconsProfileSVG.logOut,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.honeyDew,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 13),
                              Text(
                                'Log Out',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Center(
                  child: ProfileAvatar(
                    imageUrl:
                        'https://img.freepik.com/free-photo/androgynous-avatar-non-binary-queer-person_23-2151100226.jpg',
                    fallbackAsset: Assets.iconJpg.defaultAvatar,
                  ),
                ),
                const SizedBox(height: 16),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
                Text(
                  'ID: 25030024',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}