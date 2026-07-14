import 'package:flutter/material.dart';
import 'package:mcquill/core/extensions/button_size_extensions.dart';
import 'package:mcquill/core/styles/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  final IconData? icon;
  final bool enabled;
  final AppButtonSize size;
  final Color backgroundColor;
  final Color foregroundColor;

  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.enabled = true,
    required this.size,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      icon: icon != null
          ? Icon(icon, size: size.iconSize)
          : const SizedBox.shrink(),
      label: Text(label),
    );
  }
}
