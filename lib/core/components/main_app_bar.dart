/*
  COMPONENT FOLDER: Common widgets that are reusable to the entire application

  Main appbar for appbar argument in the 
  Scaffold widget as a PreferredSizeWidget

  Note:
    Leading should be the official logo of the app

    Title can be the App name, or a tab's title

    Actions should have a Profile button that leads to a route for profile
    page.


  Usage:
    appbar: ScaffoldAppBar(title: string),
*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mcquill/core/components/buttons/app_icon_button.dart';
import 'package:mcquill/core/constants/app_routes.dart';
import 'package:mcquill/core/styles/app_colors.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.onPrimary,
      title: Text(
        "MCQuill",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        // Action Buttons
        AppIconButton(
          icon: Icons.home,
          onPressed: () {
            context.go(AppRoutes.home);
          },
        ),
      ],
    );
  }
}
