import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mcquill/core/components/status/minecraft_status_config.dart';
import 'package:mcquill/core/components/status/minecraft_status_display.dart';
import 'package:mcquill/core/components/loading/app_loading_indicator.dart';
import 'package:mcquill/core/components/main_app_bar.dart';
import 'package:mcquill/core/constants/app_routes.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';
import 'package:mcquill/features/worlds/presentation/bloc/worlds_cubit.dart';
import 'package:mcquill/features/worlds/presentation/bloc/worlds_state.dart';
import 'package:mcquill/features/worlds/presentation/widgets/cards/feature_card.dart';
import 'package:mcquill/features/worlds/presentation/widgets/cards/world_card.dart';
import 'package:mcquill/features/worlds/presentation/widgets/dashboard_header.dart';

// Let's define a User Entity
// Define lng nato dire kay since offline application raman ni
class UserEntity {
  final int id;
  final String username;
  final String email;
  final List<String> gameRole;
  final String sex;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.gameRole,
    required this.sex,
  });
}

// Dashboard Screen Layout
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    context.read<WorldsCubit>().getWorlds();
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity defaultUser = UserEntity(
      id: 1,
      username: "Panzerweb",
      email: "panzerweb2023@gmail.com",
      gameRole: ['Builder'],
      sex: 'Male',
    );

    return Scaffold(
      appBar: MainAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // DASHBOARD HEADER SECTION
                DashboardHeader(user: defaultUser),

                const SizedBox(height: 12.0),

                // FEATURE CARDS SECTION
                Row(
                  children: [
                    Expanded(
                      child: FeatureCard(
                        icon: Icons.inventory_2,
                        title: "Inventory",
                        color: AppColors.grass,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FeatureCard(
                        icon: Icons.auto_awesome,
                        title: "Enchantments",
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24.0),

                const Divider(),

                const SizedBox(height: 12.0),

                Text(
                  "📌 Pinned Worlds",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.secondaryDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12.0),

                // RECENT WORLDS SECTION
                BlocBuilder<WorldsCubit, WorldsState>(
                  builder: (context, state) {
                    if (state is WorldsLoading) {
                      return AppLoadingIndicator(
                        message: "Loading Pinned Worlds",
                      );
                    }

                    if (state is WorldsLoaded) {
                      final worlds = state.worlds;
                      final pinnedWorlds = worlds.where(
                        (world) => world.isPinned,
                      );

                      if (pinnedWorlds.isEmpty) {
                        return MinecraftStatusDisplay(
                          type: MinecraftStatusType.empty,
                          message: "0 worlds found!",
                          actionText: "Load Chest Again",
                          onAction: () {
                            context.read<WorldsCubit>().getWorlds();
                          },
                        );
                      }

                      // Show latest 5 pinned worlds only
                      final recentWorlds = pinnedWorlds.take(5).toList();

                      return SizedBox(
                        height: 260,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: recentWorlds.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 16),
                          itemBuilder: (context, index) {
                            final world = recentWorlds[index];

                            return SizedBox(
                              width: 320,
                              child: WorldCard(
                                world: world,

                                onTap: () {
                                  // Navigate to world details
                                  context.push(
                                    '${AppRoutes.worlds}/${world.id}',
                                  );
                                },

                                onPin: () {
                                  print("Pin ${world.id}");
                                },

                                onDelete: () {
                                  // Delete confirmation
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }

                    if (state is WorldsError) {
                      return MinecraftStatusDisplay(
                        type: MinecraftStatusType.error,
                        message: state.error,
                        actionText: "Load Chest Again",
                        onAction: () {
                          context.read<WorldsCubit>().getWorlds();
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
