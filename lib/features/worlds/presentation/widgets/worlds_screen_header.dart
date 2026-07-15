import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

class WorldsScreenHeader extends StatelessWidget {
  const WorldsScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Your worlds are here",
          style: AppTextStyles.screenHeading.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
