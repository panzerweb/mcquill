import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  final IconData? icon;
  final bool enabled;
  final bool expand;

  const AppOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.enabled = true,
    this.expand = true,
  });

  @override
  Widget build(BuildContext context) {
    final child = icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 8),
              Text(label),
            ],
          )
        : Text(label);

    final button = OutlinedButton(
      onPressed: enabled ? onPressed : null,
      child: child,
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
