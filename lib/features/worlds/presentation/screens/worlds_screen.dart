import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mcquill/core/components/loading/app_loading_indicator.dart';
import 'package:mcquill/core/components/main_app_bar.dart';
import 'package:mcquill/core/components/status/minecraft_status_config.dart';
import 'package:mcquill/core/components/status/minecraft_status_display.dart';
import 'package:mcquill/core/constants/app_routes.dart';
import 'package:mcquill/features/worlds/presentation/bloc/worlds_cubit.dart';
import 'package:mcquill/features/worlds/presentation/bloc/worlds_state.dart';
import 'package:mcquill/features/worlds/presentation/widgets/cards/world_card.dart';
import 'package:mcquill/features/worlds/presentation/widgets/worlds_screen_header.dart';

class WorldsScreen extends StatefulWidget {
  const WorldsScreen({super.key});

  @override
  State<WorldsScreen> createState() => _WorldsScreenState();
}

class _WorldsScreenState extends State<WorldsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<WorldsCubit>().getWorlds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16.0),
          child: Column(
            children: [
              // HEADER SECTION
              WorldsScreenHeader(),

              const SizedBox(height: 12.0),

              // LIST OF WORLDS
              BlocBuilder<WorldsCubit, WorldsState>(
                builder: (context, state) {
                  if (state is WorldsLoading) {
                    return AppLoadingIndicator(message: "Loading Worlds");
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

                  if (state is WorldsLoaded) {
                    final worlds = state.worlds;

                    if (worlds.isEmpty) {
                      return MinecraftStatusDisplay(
                        type: MinecraftStatusType.empty,
                        message: "0 worlds found",
                        actionText: "Load Chest Again",
                        onAction: () {
                          context.read<WorldsCubit>().getWorlds();
                        },
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: worlds.length,
                        itemBuilder: (context, index) {
                          final world = worlds[index];

                          return WorldCard(
                            world: world,
                            onTap: () {
                              context.push('${AppRoutes.worlds}/${world.id}');
                            },
                            onPin: () {
                              print("Pin ${world.id}");
                            },
                          );
                        },
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
