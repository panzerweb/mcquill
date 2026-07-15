import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

class MinecraftTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? keyboardType;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  const MinecraftTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = enabled
        ? AppColors.surface
        : AppColors.surfaceVariant;

    final borderColor = enabled ? AppColors.stone : AppColors.secondaryLight;

    final textColor = enabled ? AppColors.textPrimary : AppColors.textSecondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label.toUpperCase(),
              style: AppTextStyles.cardHeading.copyWith(
                color: enabled ? AppColors.grass : AppColors.stone,
                letterSpacing: 1.2,
              ),
            ),

            if (!enabled) ...[
              const SizedBox(width: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.primaryDark, width: 1),
                ),
                child: Text(
                  "READ MODE",
                  style: AppTextStyles.overline.copyWith(
                    color: AppColors.primaryDark,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ],
        ),

        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: backgroundColor,

            borderRadius: BorderRadius.circular(4),

            border: Border.all(color: borderColor, width: 2),

            boxShadow: enabled
                ? const [
                    BoxShadow(color: Color(0xFFBDBDBD), offset: Offset(0, 3)),
                  ]
                : null,
          ),

          child: TextField(
            controller: controller,
            enabled: enabled,
            maxLines: maxLines,
            keyboardType: keyboardType,
            onChanged: onChanged,

            style: AppTextStyles.bodyLarge.copyWith(color: textColor),

            cursorColor: AppColors.grass,

            decoration: InputDecoration(
              hintText: hint,

              hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: enabled ? AppColors.textHint : AppColors.stone,
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),

              border: InputBorder.none,

              suffixIcon: !enabled
                  ? const Icon(Icons.lock, size: 18, color: AppColors.stone)
                  : null,

              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grass, width: 3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
