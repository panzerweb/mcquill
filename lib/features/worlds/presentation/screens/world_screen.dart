import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcquill/core/components/buttons/app_icon_button.dart';
import 'package:mcquill/core/components/loading/app_loading_indicator.dart';
import 'package:mcquill/core/components/pushed_app_bar.dart';
import 'package:mcquill/core/components/status/minecraft_status_config.dart';
import 'package:mcquill/core/components/status/minecraft_status_display.dart';
import 'package:mcquill/core/extensions/button_size_extensions.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/features/worlds/presentation/bloc/world_detail_cubit.dart';
import 'package:mcquill/features/worlds/presentation/bloc/world_detail_state.dart';
import 'package:mcquill/features/worlds/presentation/screens/world_detail_overlay_screen.dart';
import 'package:mcquill/features/worlds/presentation/widgets/minecraft_tab_bar.dart';
import 'package:mcquill/features/worlds/presentation/widgets/tabs/locations_tab.dart';
import 'package:mcquill/features/worlds/presentation/widgets/tabs/lore_tab.dart';
import 'package:mcquill/features/worlds/presentation/widgets/tabs/overview_tab.dart';
import 'package:mcquill/features/worlds/presentation/widgets/tabs/tasks_tab.dart';

class WorldScreen extends StatefulWidget {
  final int? worldId;

  const WorldScreen({super.key, required this.worldId});

  @override
  State<WorldScreen> createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {
  bool readMode = false;

  @override
  void initState() {
    super.initState();

    context.read<WorldDetailCubit>().getWorldById(widget.worldId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorldDetailCubit, WorldDetailState>(
      builder: (context, state) {
        if (state is WorldDetailLoading) {
          return AppLoadingIndicator(message: "Fetching World Details");
        }
        if (state is WorldDetailError) {
          return MinecraftStatusDisplay(
            type: MinecraftStatusType.error,
            message: state.error,
          );
        }
        if (state is WorldDetailLoaded) {
          final world = state.world;

          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: PushedAppBar(
                pageTitle: world.name,
                customActions: [
                  AppIconButton(
                    icon: readMode ? Icons.menu_book : Icons.edit_note_rounded,
                    onPressed: () {
                      setState(() {
                        readMode = !readMode;
                      });
                    },
                    size: AppButtonSize.large,
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppColors.primary,
                  ),
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    MinecraftTabBar(
                      tabs: ["Overview", "Tasks", "Lore", "Locations"],
                    ),

                    Expanded(
                      child: TabBarView(
                        children: [
                          OverviewTab(world: world, isReadMode: readMode),
                          TasksTab(),
                          LoreTab(),
                          LocationsTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
