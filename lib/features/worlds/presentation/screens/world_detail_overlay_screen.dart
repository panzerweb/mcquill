/*
  This screen is for overlaying the page to the WorldScreen

  Here we can edit the world details (category, tags), tasks, lore, location
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcquill/core/components/dropdown/minecraft_dropdown.dart';
import 'package:mcquill/core/components/textfields/minecraft_text_field.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';
import 'package:mcquill/features/worlds/presentation/bloc/categories_cubit.dart';
import 'package:mcquill/features/worlds/presentation/bloc/categories_state.dart';

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
  final TextEditingController _worldDescriptionController =
      TextEditingController();
  late CategoryEntity _selectedCategory;

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getAllCategories();

    // Initialize text controllers with current world data
    _worldNameController.text = widget.world.name;
    _worldDescriptionController.text = widget.world.description;
    _selectedCategory = widget.world.category;
  }

  @override
  void dispose() {
    // Always clean up controllers to prevent memory leaks
    _worldNameController.dispose();
    _worldDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We invert 'isReadMode' so the fields are ONLY editable when read mode is false.
    final bool isEditable = !widget.isReadMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // FIELDS
        MinecraftTextField(
          label: "World Name",
          controller: _worldNameController,
          enabled: isEditable,
        ),

        const SizedBox(height: 12.0),

        MinecraftTextField(
          label: "World Description",
          controller: _worldDescriptionController,
          enabled: isEditable,
          height: 200.0, // Uses our newly supported height parameter!
        ),

        const SizedBox(height: 16.0),

        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.nether),
              );
            }

            if (state is CategoriesLoaded) {
              final categories = state.categories;

              // Safe fallback handling: If the currently selected category doesn't
              // exist in the loaded list, safely fallback to the first element.
              final initialValue = categories.contains(_selectedCategory)
                  ? _selectedCategory
                  : (categories.isNotEmpty ? categories.first : null);

              return MinecraftDropdown<CategoryEntity>(
                label: "Categories",
                enabled: isEditable,
                hintText: 'Select an option',
                initialSelection: initialValue,
                items: categories,
                itemLabelBuilder: (CategoryEntity category) => category.name,
                onSelected: (CategoryEntity? category) {
                  if (category != null) {
                    setState(() {
                      _selectedCategory = category;
                    });
                    print('Selected Category: ${category.name}');
                  }
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),

        const SizedBox(height: 16.0),

        // TABS (Placeholder for Overview, Tasks, Locations, Lore)
        // You can implement this using a TabBar or custom Minecraft-styled buttons.
      ],
    );
  }
}
