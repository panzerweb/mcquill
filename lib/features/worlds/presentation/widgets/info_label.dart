import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

class InfoLabel extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoLabel({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14),

        const SizedBox(width: 4),

        Text(
          text,
          style: AppTextStyles.caption.copyWith(color: AppColors.tertiaryLight),
        ),
      ],
    );
  }
}
