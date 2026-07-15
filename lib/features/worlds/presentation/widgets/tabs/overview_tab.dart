import 'package:flutter/material.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';
import 'package:mcquill/features/worlds/presentation/screens/world_detail_overlay_screen.dart';

class OverviewTab extends StatelessWidget {
  final WorldEntity world;
  final bool isReadMode;

  const OverviewTab({super.key, required this.world, required this.isReadMode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: WorldDetailOverlayScreen(world: world, isReadMode: isReadMode),
    );
  }
}
