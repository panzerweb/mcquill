import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

class MinecraftTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final bool expand;
  final double? height;

  const MinecraftTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.enabled = true,
    this.onChanged,
    this.expand = false,
    this.height,
  });

  @override
  State<MinecraftTextField> createState() => _MinecraftTextFieldState();
}

class _MinecraftTextFieldState extends State<MinecraftTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.enabled
        ? AppColors.surface
        : AppColors.surfaceVariant;

    // Define border color based on focus & enabled state (Minecraft green when focused!)
    final borderColor = !widget.enabled
        ? AppColors.secondaryLight
        : _isFocused
        ? AppColors.grass
        : AppColors.stone;

    final borderWidth = _isFocused ? 3.0 : 2.0;
    final textColor = widget.enabled
        ? AppColors.textPrimary
        : AppColors.textSecondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label.toUpperCase(),
              style: AppTextStyles.cardHeading.copyWith(
                color: widget.enabled ? AppColors.grass : AppColors.stone,
                letterSpacing: 1.2,
              ),
            ),
            if (!widget.enabled) ...[
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
          height: widget.height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: borderColor, width: borderWidth),
            boxShadow: widget.enabled
                ? const [
                    BoxShadow(color: Color(0xFFBDBDBD), offset: Offset(0, 3)),
                  ]
                : null,
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            maxLines: widget.height != null || widget.expand
                ? null
                : widget.maxLines,
            minLines: widget.height != null || widget.expand
                ? null
                : widget.minLines,
            keyboardType: widget.keyboardType,
            onChanged: widget.onChanged,
            expands: widget.height != null || widget.expand,
            style: AppTextStyles.bodyLarge.copyWith(color: textColor),
            cursorColor: AppColors.grass,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: widget.enabled ? AppColors.textHint : AppColors.stone,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              // We use InputBorder.none because the outer Container is handling the border completely now
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              suffixIcon: !widget.enabled
                  ? const Icon(Icons.lock, size: 18, color: AppColors.stone)
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
