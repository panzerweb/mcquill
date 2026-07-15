import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';

class StatisticalCard extends StatelessWidget {
  final int tasksCompleted;
  final int worldCount;
  final int loreCreated;
  final int importantCoordinates;

  const StatisticalCard({
    super.key,
    required this.tasksCompleted,
    required this.worldCount,
    required this.loreCreated,
    required this.importantCoordinates,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.tertiary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.tertiaryLight, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.bar_chart, color: AppColors.success),

              const SizedBox(width: 8),

              Text(
                "World Statistics",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.8,
            children: [
              _StatTile(
                icon: Icons.check_circle,
                title: "Tasks Done",
                value: tasksCompleted.toString(),
                color: Colors.green,
              ),

              _StatTile(
                icon: Icons.public,
                title: "Worlds",
                value: worldCount.toString(),
                color: Colors.lightGreen,
              ),

              _StatTile(
                icon: Icons.auto_stories,
                title: "Lore Created",
                value: loreCreated.toString(),
                color: Colors.purpleAccent,
              ),

              _StatTile(
                icon: Icons.location_on,
                title: "Coordinates",
                value: importantCoordinates.toString(),
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _StatTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.tertiaryLight,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),

            child: Icon(icon, color: color, size: 22),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  value,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textHint,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  title,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
