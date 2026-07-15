import 'package:flutter/material.dart';

class LoreTab extends StatefulWidget {
  const LoreTab({super.key});

  @override
  State<LoreTab> createState() => _LoreTabState();
}

class _LoreTabState extends State<LoreTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(16.0),
      child: Center(child: Text("Lore")),
    );
  }
}
