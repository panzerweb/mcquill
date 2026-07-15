import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcquill/core/routes/routes.dart';
import 'package:mcquill/core/services/service_locator.dart';
import 'package:mcquill/core/styles/app_colors.dart';
import 'package:mcquill/features/worlds/presentation/bloc/categories_cubit.dart';
import 'package:mcquill/features/worlds/presentation/bloc/world_detail_cubit.dart';
import 'package:mcquill/features/worlds/presentation/bloc/worlds_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<WorldsCubit>(create: (_) => locator<WorldsCubit>()),
        BlocProvider<WorldDetailCubit>(
          create: (_) => locator<WorldDetailCubit>(),
        ),
        BlocProvider<CategoriesCubit>(
          create: (_) => locator<CategoriesCubit>(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MCQuill',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.grass),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
