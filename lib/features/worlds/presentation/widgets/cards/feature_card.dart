import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

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
        color: AppColors.tertiary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.tertiaryLight, width: 2),
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
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textHint,
            ),
          ),
        ],
      ),
    );
  }
}
