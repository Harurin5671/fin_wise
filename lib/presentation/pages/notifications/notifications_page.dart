import 'dart:developer';

import 'package:fin_wise/core/navigation/navigation_service_impl.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:fin_wise/core/utils/date_utils.dart';
import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:fin_wise/config/constants/assets.dart';
import 'package:fin_wise/config/theme/app_text_styles.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final grouped = groupNotifications(mockNotifications);

    final sectionEntries = grouped.entries
        .where((entry) => entry.value.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () => NavigationServiceImpl().pop(),
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
        ),
        title: Text(
          'Notificaciones',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDarkMode ? AppColors.vividBlue : Color(0xFFDFF7E2),
                ),
                child: SvgPicture.asset(
                  Assets.iconsNotificationsSVG.reminder,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? AppColors.honeyDew : AppColors.darkGreen,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(70),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 20),
          color: isDarkMode ? AppColors.darkGreen : AppColors.honeyDew,
          child: ListView.separated(
            itemCount: sectionEntries.length,
            itemBuilder: (context, index) {
              final section = sectionEntries[index];
              final title = section.key;
              final items = section.value;
              log('Soy el items: ${items.first.category}');

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      title,
                      style: AppTextStyles(context).subtextLeagueSpartan,
                    ),
                  ),
                  ...items.map(
                    (notification) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              height: 37,
                              width: 37,
                              decoration: BoxDecoration(
                                color: AppColors.caribbeanGreen,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SvgPicture.asset(
                                _getNotificationIconPath(notification.category),
                                // width: 20,
                                // height:20,
                              ),
                            ),
                            title: Text(
                              notification.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              notification.description,
                              style: AppTextStyles(
                                context,
                              ).subtextLeagueSpartan,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${notification.dateTime.hour.toString().padLeft(2, '0')}:${notification.dateTime.minute.toString().padLeft(2, '0')} - ${DateTimeUtils.formatToMonthYear(notification.dateTime)}',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: isDarkMode
                                        ? AppColors.lightBlue
                                        : AppColors.oceanBlue,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1.5,
                color: isDarkMode ? AppColors.lightGreen : Color(0xFF00D09E),
              );
            },
          ),
        ),
      ),
    );
  }
}

Map<String, List<NotificationModel>> groupNotifications(
  List<NotificationModel> notifications,
) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));

  Map<String, List<NotificationModel>> sections = {
    'Hoy': [],
    'Ayer': [],
    'Esta semana': [],
    'Este mes': [],
  };

  for (var notif in notifications) {
    final date = DateTime(
      notif.dateTime.year,
      notif.dateTime.month,
      notif.dateTime.day,
    );

    if (date == today) {
      sections['Hoy']!.add(notif);
    } else if (date == yesterday) {
      sections['Ayer']!.add(notif);
    } else if (date.isAfter(today.subtract(Duration(days: now.weekday)))) {
      sections['Esta semana']!.add(notif);
    } else if (date.month == now.month && date.year == now.year) {
      sections['Este mes']!.add(notif);
    }
  }

  return sections;
}

final List<NotificationModel> mockNotifications = [
  NotificationModel(
    category: NotificationCategory.reminder,
    title: '¡Recordatorio!',
    description: 'Se ha registrado una nueva transacción: Alimentos | \$120.00',
    dateTime: DateTime.now().subtract(Duration(hours: 1)), // Hoy
  ),
  NotificationModel(
    category: NotificationCategory.update,
    title: '¡Actualización!',
    description: 'Se actualizó tu presupuesto mensual.',
    dateTime: DateTime.now().subtract(Duration(days: 1)), // Ayer
  ),
  NotificationModel(
    category: NotificationCategory.reminder,
    title: '¡Recordatorio!',
    description: 'Tu meta de ahorro semanal vence pronto.',
    dateTime: DateTime.now().subtract(Duration(days: 3)), // Esta semana
  ),
  NotificationModel(
    category: NotificationCategory.expense,
    title: '¡Recordatorio!',
    description: 'Tu meta de ahorro semanal vence pronto.',
    dateTime: DateTime.now().subtract(Duration(days: 3)), // Esta semana
  ),
  NotificationModel(
    category: NotificationCategory.saving,
    title: '¡Recordatorio!',
    description: 'Tu meta de ahorro semanal vence pronto.',
    dateTime: DateTime.now().subtract(Duration(days: 3)), // Esta semana
  ),
  NotificationModel(
    category: NotificationCategory.update,
    title: '¡Recordatorio!',
    description: 'Tu meta de ahorro semanal vence pronto.',
    dateTime: DateTime.now().subtract(Duration(days: 3)), // Esta semana
  ),
  NotificationModel(
    category: NotificationCategory.saving,
    title: '¡Transacción vieja!',
    description: 'Registro de transacción antigua.',
    dateTime: DateTime.now().subtract(Duration(days: 10)), // Este mes
  ),
  NotificationModel(
    category: NotificationCategory.expense,
    title: '¡Transacción nueva!',
    description: 'Se ha registrado una nueva transacción: Alimentos | \$120.00',
    dateTime: DateTime.now().subtract(Duration(hours: 1)), // Hoy
  ),
];

class NotificationModel {
  final NotificationCategory category;
  final String title;
  final String description;
  final DateTime dateTime;

  NotificationModel({
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
  });
}

String _getNotificationIconPath(NotificationCategory category) {
  switch (category) {
    case NotificationCategory.reminder:
      return Assets.iconsNotificationsSVG.reminder;
    case NotificationCategory.transaction:
      return Assets.iconsNotificationsSVG.transaction;
    case NotificationCategory.expense:
      return Assets.iconsNotificationsSVG.expense;
    case NotificationCategory.saving:
      return Assets.iconsNotificationsSVG.saving;
    case NotificationCategory.update:
      return Assets.iconsNotificationsSVG.update;
  }
}

enum NotificationCategory { reminder, transaction, expense, saving, update }
