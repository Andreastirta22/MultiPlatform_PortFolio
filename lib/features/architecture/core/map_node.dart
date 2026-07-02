import 'package:flutter/material.dart';

class MapNode extends StatelessWidget {
  final double top;
  final Widget child;

  const MapNode({super.key, required this.top, required this.child});

  @override
  Widget build(BuildContext context) {
    return Positioned(top: top, left: 0, right: 0, child: child);
  }
}
