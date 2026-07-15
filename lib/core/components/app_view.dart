import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mcquill/core/styles/app_colors.dart';

class AppView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppView({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        indicatorColor: Colors.transparent,
        onDestinationSelected: _goBranch,
        backgroundColor: AppColors.primaryDark,
        destinations: [
          _menuItem(
            context,
            index: 0,
            currentIndex: navigationShell.currentIndex,
            icon: Icons.dashboard,
            label: 'Dashboard',
          ),
          _menuItem(
            context,
            index: 1,
            currentIndex: navigationShell.currentIndex,
            icon: Icons.public,
            label: 'Worlds',
          ),
          _menuItem(
            context,
            index: 2,
            currentIndex: navigationShell.currentIndex,
            icon: Icons.settings,
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required String label,
    required IconData icon,
  }) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: currentIndex == index ? AppColors.gold : AppColors.grass,
      ),
      label: label,
    );
  }
}
