import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:circular_progress_with_logo/circular_progress_with_logo.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

class AppLoadingIndicator extends StatelessWidget {
  final String message;

  const AppLoadingIndicator({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLoader(
              size: 70,
              color: AppColors.grass,
              style: LoaderStyle.wave,
              logoAsset: 'assets/icons/icons8-minecraft-logo-75.png',
            ),

            const SizedBox(height: 8.0),

            Text(
              message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
