import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mcquill/core/components/app_view.dart';
import 'package:mcquill/core/constants/app_routes.dart';
import 'package:mcquill/features/home_screen.dart';
import 'package:mcquill/features/settings/presentation/screens/settings_screen.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';
import 'package:mcquill/features/worlds/presentation/screens/dashboard_screen.dart';
import 'package:mcquill/features/worlds/presentation/screens/world_screen.dart';
import 'package:mcquill/features/worlds/presentation/screens/worlds_screen.dart';

final _routerKey = GlobalKey<NavigatorState>();

final _shellNavigatorDashboardsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellDashboard',
);
final _shellNavigatorWorldsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellWorlds',
);
final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellSettings',
);

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.home,
  routes: [
    // HOME
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return HomeScreen();
      },
    ),

    // ROUTES INSIDE STATEFUL SHELL ROUTE AND BOTTOM NAVIGATION BAR
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppView(navigationShell: navigationShell);
      },
      branches: [
        // For Dashboard
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDashboardsKey,
          routes: [
            GoRoute(
              path: AppRoutes.dashboard,
              builder: (context, state) {
                return DashboardScreen();
              },
            ),
          ],
        ),

        // Worlds
        StatefulShellBranch(
          navigatorKey: _shellNavigatorWorldsKey,
          routes: [
            GoRoute(
              path: AppRoutes.worlds,
              builder: (context, state) {
                return WorldsScreen();
              },
            ),
          ],
        ),

        // Settings
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            GoRoute(
              path: AppRoutes.setting,
              builder: (context, state) {
                return SettingsScreen();
              },
            ),
          ],
        ),
      ],
    ),

    // OUTSIDE THE STATEFULL SHELLROUTE TO NOT INCLUDE THESE ROUTES INTO THE BOTTOM NAVIGATION BAR
    GoRoute(
      path: '${AppRoutes.worlds}/${AppRoutes.world}',
      builder: (context, state) {
        final String? worldId = state.pathParameters['worldId'];

        return WorldScreen(worldId: int.tryParse(worldId ?? '0'));
      },
    ),
  ],
);
