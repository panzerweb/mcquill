import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

class MinecraftDropdown<T> extends StatelessWidget {
  final String label;
  final bool enabled;
  final List<T> items;
  final T? initialSelection;
  final ValueChanged<T?> onSelected;
  final String Function(T) itemLabelBuilder;
  final String? hintText;

  const MinecraftDropdown({
    super.key,
    required this.label,
    required this.enabled,
    required this.items,
    this.initialSelection,
    required this.onSelected,
    required this.itemLabelBuilder,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
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

        // Dropdown itself
        DropdownMenu<T>(
          enabled: enabled,
          expandedInsets: EdgeInsets.zero,
          initialSelection: initialSelection,
          hintText: hintText,
          onSelected: onSelected,

          textStyle: AppTextStyles.bodyLarge.copyWith(
            color: enabled ? AppColors.textPrimary : AppColors.textSecondary,
          ),

          menuStyle: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.surface),
            elevation: const WidgetStatePropertyAll(0),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: AppColors.stone, width: 2),
              ),
            ),
          ),

          inputDecorationTheme: InputDecorationTheme(
            filled: true,

            fillColor: enabled ? AppColors.surface : AppColors.surfaceVariant,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.stone, width: 2),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.stone, width: 2),
            ),

            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.secondaryLight, width: 2),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.grass, width: 3),
            ),
          ),
          dropdownMenuEntries: items.map<DropdownMenuEntry<T>>((T item) {
            return DropdownMenuEntry<T>(
              value: item,
              label: itemLabelBuilder(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}
