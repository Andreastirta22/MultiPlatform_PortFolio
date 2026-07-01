import 'package:flutter/material.dart';

class ArchitectureIntro extends StatelessWidget {
  const ArchitectureIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ARCHITECTURE", style: TextStyle(fontSize: 14, letterSpacing: 2)),
        SizedBox(height: 24),
        Text(
          "Building scalable digital experiences through modular engineering",
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        SizedBox(height: 24),
        Text(
          "A modern architecture that enables maintainability, scalability and developer productivity",
          style: TextStyle(fontSize: 16, height: 1.7),
        ),
        SizedBox(width: 32),
        Row(
          children: [
            _Feature(icon: Icons.extension, title: "Modular"),
            SizedBox(height: 32),
            _Feature(icon: Icons.shield, title: "Secure"),
            SizedBox(height: 32),
            _Feature(icon: Icons.sync, title: "Realtime"),
          ],
        ),
      ],
    );
  }
}

class _Feature extends StatelessWidget {
  final IconData icon;

  final String title;

  const _Feature({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(icon), SizedBox(height: 12), Text(title)]);
  }
}
