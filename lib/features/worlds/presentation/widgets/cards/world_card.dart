/*
  This world card will contain the basic information
  as well as count of tasks, how many tasks are completed
  The category of tasks
*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';
import 'package:mcquill/core/utils/category_mapper.dart';
import 'package:mcquill/features/worlds/domain/entities/world_entity.dart';
import 'package:mcquill/features/worlds/presentation/widgets/info_label.dart';
import 'package:mcquill/features/worlds/presentation/widgets/pinned_chip.dart';

class WorldCard extends StatelessWidget {
  final WorldEntity world;
  final VoidCallback? onTap;
  final VoidCallback? onPin;
  final VoidCallback? onDelete;
  final double height;

  const WorldCard({
    super.key,
    required this.world,
    this.onTap,
    this.onPin,
    this.onDelete,
    this.height = 260,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.primaryLight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: CategoryMapper.colorFromHex(
                            world.category.color,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          CategoryMapper.getWorldIcon(world.category.icon),
                          color: AppColors.surface,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              world.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              world.category.name,
                              style: AppTextStyles.labelMedium.copyWith(
                                color: CategoryMapper.colorFromHex(
                                  world.category.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: "pin",
                            child: Text(world.isPinned ? "Unpin" : "Pin"),
                          ),
                          PopupMenuItem(value: "delete", child: Text("Delete")),
                        ],
                        onSelected: (value) {
                          if (value == "pin") {
                            onPin?.call();
                          }

                          if (value == "delete") {
                            onDelete?.call();
                          }
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// Description
                  Text(
                    world.description.isEmpty
                        ? "No description"
                        : world.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.tertiaryLight,
                    ),
                  ),

                  const SizedBox(height: 24.0),

                  /// Metadata
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoLabel(
                        icon: Icons.calendar_today,
                        text: DateFormat.yMMMd().format(world.createdAt),
                      ),

                      InfoLabel(
                        icon: Icons.update,
                        text: DateFormat.yMMMd().format(world.updatedAt),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Pinned Icon
        if (world.isPinned) PinnedChip(),
      ],
    );
  }
}
