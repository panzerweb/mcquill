import 'package:flutter/material.dart';
import 'package:mcquill/core/components/buttons/app_elevated_button.dart';
import 'package:mcquill/core/extensions/button_size_extensions.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

import 'minecraft_status_config.dart';

class MinecraftStatusDisplay extends StatelessWidget {
  final MinecraftStatusType type;

  final String message;

  final String? actionText;

  final VoidCallback? onAction;

  const MinecraftStatusDisplay({
    super.key,
    required this.type,
    required this.message,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final config = MinecraftStatusConfig.fromType(type);

    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: config.color.withValues(alpha: 0.08),

        borderRadius: BorderRadius.circular(6),

        border: Border.all(color: config.color, width: 2),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(config.icon, color: config.color),

              const SizedBox(width: 10),

              Text(
                config.title,
                style: AppTextStyles.cardHeading.copyWith(color: config.color),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(message, style: AppTextStyles.bodyMedium),

          if (actionText != null) ...[
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerRight,

              child: AppElevatedButton(
                label: actionText!,
                onPressed: onAction,
                backgroundColor: AppColors.primaryDark,
                foregroundColor: AppColors.onPrimary,
                enabled: true,
                size: AppButtonSize.small,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
