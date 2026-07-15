import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

class PushedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String pageTitle;
  final List<Widget>? customActions;

  const PushedAppBar({super.key, required this.pageTitle, this.customActions});

  @override
  State<PushedAppBar> createState() => _PushedAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _PushedAppBarState extends State<PushedAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.onPrimary,
      title: Text(
        widget.pageTitle,
        style: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: widget.customActions,
    );
  }
}
