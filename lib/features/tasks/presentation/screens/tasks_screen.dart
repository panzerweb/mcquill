import 'package:flutter/material.dart';
import 'package:mcquill/core/components/main_app_bar.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MainAppBar(), body: Text("Tasks Screen"));
  }
}
