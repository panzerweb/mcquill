import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mcquill/core/components/buttons/app_elevated_button.dart';
import 'package:mcquill/core/constants/app_routes.dart';
import 'package:mcquill/core/styles/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              // Logo
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.grass,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryDark.withOpacity(.25),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(Icons.grass, size: 70, color: Colors.white),
              ),

              const SizedBox(height: 28),

              const Text(
                "MCQuill",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your Offline Minecraft Companion",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
              ),

              const SizedBox(height: 48),

              const Spacer(),

              AppElevatedButton(
                label: 'Enter World',
                backgroundColor: AppColors.primaryDark,
                foregroundColor: AppColors.onPrimary,
                enabled: true,

                onPressed: () {
                  context.pushReplacement(AppRoutes.dashboard);
                },
              ),

              const SizedBox(height: 18),

              const Text(
                "MCQuill v1.0.0",
                style: TextStyle(color: AppColors.textHint),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
