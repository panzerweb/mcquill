/*
  This screen is for overlaying the page to the WorldScreen

  Here we can edit the world details (category, tags), tasks, lore, location
*/

import 'package:flutter/material.dart';
import 'package:mcquill/core/components/textfields/minecraft_text_field.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';

class WorldDetailOverlayScreen extends StatefulWidget {
  final WorldEntity world;
  final bool isReadMode;

  const WorldDetailOverlayScreen({
    super.key,
    required this.world,
    required this.isReadMode,
  });

  @override
  State<WorldDetailOverlayScreen> createState() =>
      _WorldDetailOverlayScreenState();
}

class _WorldDetailOverlayScreenState extends State<WorldDetailOverlayScreen> {
  final TextEditingController _worldNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // TextEditingControllers
    _worldNameController.text = widget.world.name;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MinecraftTextField(
          label: "World Name",
          controller: _worldNameController,
          enabled: widget.isReadMode,
        ),
      ],
    );
  }
}
