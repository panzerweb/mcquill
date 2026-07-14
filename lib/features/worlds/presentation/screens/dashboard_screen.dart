import 'package:flutter/material.dart';
import 'package:mcquill/core/components/main_app_bar.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/features/worlds/presentation/widgets/cards/feature_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DASHBOARD HEADER SECTION
              Text(
                "Welcome!",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12.0),

              // FEATURE CARDS SECTION
              Row(
                children: [
                  Expanded(
                    child: FeatureCard(
                      icon: Icons.inventory_2,
                      title: "Items",
                      color: AppColors.grass,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FeatureCard(
                      icon: Icons.construction,
                      title: "Blocks",
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
