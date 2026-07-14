import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  final IconData? icon;
  final bool enabled;

  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
      label: Text(label),
    );
  }
}
