import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';

/*

  You can use this like this:
    Row(
      children: [
        Expanded(
          child: _FeatureCard(
            icon: Icons.inventory_2,
            title: "Items",
            color: AppColors.grass,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _FeatureCard(
            icon: Icons.construction,
            title: "Blocks",
            color: AppColors.secondary,
          ),
        ),
      ],
    ),

*/
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const FeatureCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(.15),
            radius: 24,
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
