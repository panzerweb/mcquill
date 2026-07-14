import 'package:flutter/material.dart';
import 'package:mcquill/core/components/main_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MainAppBar(), body: Text("Settings Screen"));
  }
}
