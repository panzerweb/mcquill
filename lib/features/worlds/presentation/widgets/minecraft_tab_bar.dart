import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

class MinecraftTabBar extends StatelessWidget {
  final List<String> tabs;

  const MinecraftTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.secondaryDark),

      child: TabBar(
        isScrollable: true,

        padding: const EdgeInsets.all(4),

        indicator: BoxDecoration(
          color: AppColors.grass,

          borderRadius: BorderRadius.circular(6),
        ),

        labelColor: AppColors.surface,

        unselectedLabelColor: AppColors.dirt,

        labelStyle: AppTextStyles.labelMedium.copyWith(
          fontWeight: FontWeight.bold,
        ),

        dividerColor: Colors.transparent,

        tabs: tabs.map((tab) {
          return Tab(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),

              child: Text(tab.toUpperCase()),
            ),
          );
        }).toList(),
      ),
    );
  }
}
