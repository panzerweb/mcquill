import 'package:flutter/material.dart';
import 'package:mcquill/core/constants/enums.dart';

class CategoryMapper {
  static IconData getWorldIcon(WorldIconEnums categoryIcon) {
    switch (categoryIcon) {
      case WorldIconEnums.pickaxe:
        return Icons.construction;

      case WorldIconEnums.castle:
        return Icons.castle;

      case WorldIconEnums.skull:
        return Icons.local_fire_department;

      case WorldIconEnums.bolt:
        return Icons.auto_awesome;
    }
  }

  static Color colorFromHex(String hex) {
    return Color(int.parse(hex.replaceFirst('#', '0XFF')));
  }
}
