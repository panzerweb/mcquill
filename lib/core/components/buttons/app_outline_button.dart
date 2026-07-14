import 'package:flutter/material.dart';
import 'package:mcquill/core/extensions/button_size_extensions.dart';

class AppOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  final IconData? icon;
  final bool enabled;
  final bool expand;
  final AppButtonSize size;

  const AppOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.enabled = true,
    this.expand = true,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final child = icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: size.iconSize),
              const SizedBox(width: 8),
              Text(label),
            ],
          )
        : Text(label);

    final button = OutlinedButton(
      onPressed: enabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        padding: size.padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4.0),
        ),
      ),
      child: child,
    );

    return expand
        ? SizedBox(width: double.infinity, height: size.height, child: button)
        : button;
  }
}
