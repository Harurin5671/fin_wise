import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:fin_wise/config/theme/app_colors.dart';
import 'package:fin_wise/config/constants/assets.dart';

class SummaryCard extends StatelessWidget {
  final double balance = 7783.00;
  final double expense = -1187.40;
  final double progressPercent = 0.3; // 30%
  final double goal = 20000.00;

  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BalanceItem(
                icon: Assets.iconsSvg.income,
                label: 'Total Balance',
                value: '\$${balance.toStringAsFixed(2)}',
                valueStyle: Theme.of(context).textTheme.titleLarge,
              ),
              Container(height: 40, width: 1, color: Color(0xFFDFF7E2)),
              _BalanceItem(
                icon: Assets.iconsSvg.expense,
                label: 'Total Expense',
                value: '-\$${expense.abs().toStringAsFixed(2)}',
                valueStyle: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.oceanBlue),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.voidColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 1 - progressPercent,
                  child: Container(
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.honeyDew,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(progressPercent * 100).toInt()}%',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.honeyDew,
                      ),
                    ),
                    Text(
                      '\$${goal.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        color: AppColors.fenceGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.check_box_outlined, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '30% Of Your Expenses, Looks Good.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BalanceItem extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final TextStyle? valueStyle;

  const _BalanceItem({
    required this.icon,
    required this.label,
    required this.value,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 12,
              height: 12,
              colorFilter: ColorFilter.mode(
                isDark ? AppColors.honeyDew : AppColors.fenceGreen,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(value, style: valueStyle),
      ],
    );
  }
}
