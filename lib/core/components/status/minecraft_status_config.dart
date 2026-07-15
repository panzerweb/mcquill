import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';

enum MinecraftStatusType { empty, info, locked, error, warning, success }

class MinecraftStatusConfig {
  final String title;
  final IconData icon;
  final Color color;

  MinecraftStatusConfig({
    required this.title,
    required this.icon,
    required this.color,
  });

  static MinecraftStatusConfig fromType(MinecraftStatusType type) {
    switch (type) {
      case MinecraftStatusType.empty:
        return MinecraftStatusConfig(
          title: "EMPTY CHEST",
          icon: Icons.inventory_2_outlined,
          color: AppColors.stone,
        );

      case MinecraftStatusType.info:
        return MinecraftStatusConfig(
          title: "TIP",
          icon: Icons.info_outline,
          color: AppColors.diamond,
        );

      case MinecraftStatusType.locked:
        return MinecraftStatusConfig(
          title: "LOCKED BLOCK",
          icon: Icons.lock,
          color: AppColors.tertiary,
        );

      case MinecraftStatusType.error:
        return MinecraftStatusConfig(
          title: "REDSTONE ERROR",
          icon: Icons.warning,
          color: AppColors.redstone,
        );

      case MinecraftStatusType.warning:
        return MinecraftStatusConfig(
          title: "WARNING",
          icon: Icons.priority_high,
          color: AppColors.gold,
        );

      case MinecraftStatusType.success:
        return MinecraftStatusConfig(
          title: "COMPLETED",
          icon: Icons.check,
          color: AppColors.grass,
        );
    }
  }
}
