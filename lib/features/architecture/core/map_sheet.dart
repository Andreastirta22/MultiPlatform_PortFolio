import 'package:flutter/material.dart';

class MapSheet extends StatelessWidget {
  final List<Widget> nodes;
  const MapSheet({super.key, required this.nodes});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔥 background kertas
        Positioned.fill(child: Container(color: const Color(0xFFF5F5F2))),

        // 🔥 nodes di atas kertas
        ...nodes,
      ],
    );
  }
}
