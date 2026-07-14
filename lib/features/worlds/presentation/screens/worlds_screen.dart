import 'package:flutter/material.dart';
import 'package:mcquill/core/components/main_app_bar.dart';

class WorldsScreen extends StatelessWidget {
  const WorldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MainAppBar(), body: Text("Worlds Screen"));
  }
}
