import 'package:fin_wise/config/constants/assets.dart';
import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:fin_wise/core/navigation/navigation_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FinWiseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final Widget title;
  final bool centerTitle;
  final List<Widget> actions;

  const FinWiseAppBar({
    super.key,
    this.showBackButton = false,
    this.onBackTap,
    required this.title,
    this.centerTitle = false,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onBackTap ?? () => NavigationServiceImpl().pop(),
                child: Container(
                  padding: const EdgeInsets.all(11),
                  child: SvgPicture.asset(
                    Assets.iconsSvg.arrowBack,
                    colorFilter: ColorFilter.mode(
                      AppColors.honeyDew,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            )
          : null,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
