import 'package:flutter/material.dart';

class ArchitectureIntro extends StatelessWidget {
  const ArchitectureIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ARCHITECTURE",
          style: TextStyle(fontSize: 12, letterSpacing: 2, color: Colors.grey),
        ),

        const SizedBox(height: 24),

        Text(
          "Building scalable digital experiences through modular engineering",
          style: TextStyle(
            fontSize: isMobile ? 28 : 42,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),

        const SizedBox(height: 24),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            "A modern architecture that enables maintainability, scalability and developer productivity",
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              height: 1.7,
              color: Colors.grey[700],
            ),
          ),
        ),

        const SizedBox(height: 32),

        Row(
          children: const [
            Expanded(
              child: _Feature(icon: Icons.extension, title: "Modular"),
            ),

            Expanded(
              child: _Feature(icon: Icons.shield, title: "Secure"),
            ),

            Expanded(
              child: _Feature(icon: Icons.sync, title: "Realtime"),
            ),
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
    return Column(
      children: [
        Icon(icon, size: 28),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
