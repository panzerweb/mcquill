import 'package:flutter/material.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/core/styles/app_text_styles.dart';
import 'package:mcquill/features/worlds/presentation/screens/dashboard_screen.dart';
import 'package:mcquill/features/worlds/presentation/widgets/cards/statistical_card.dart';

class DashboardHeader extends StatelessWidget {
  final UserEntity user;

  const DashboardHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good Evening",
          style: AppTextStyles.titleMedium.copyWith(color: AppColors.secondary),
        ),

        const SizedBox(height: 4.0),

        Text(
          "Welcome, ${user.username}",
          style: AppTextStyles.displayMedium.copyWith(
            color: AppColors.secondaryDark,
          ),
        ),

        const SizedBox(height: 12.0),

        // STATISTICAL CARDS
        // Shows Tasks completed, World Count, Stars regarding base on task completion, current achievements set by app
        StatisticalCard(
          tasksCompleted: 124,
          worldCount: 8,
          loreCreated: 35,
          importantCoordinates: 17,
        ),
      ],
    );
  }
}
