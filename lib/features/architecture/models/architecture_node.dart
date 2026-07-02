import 'package:flutter/material.dart';

class ArchitectureNode {
  final String id;
  final int order;
  final double? depth;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;

  const ArchitectureNode({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.id,
    required this.order,
    required this.depth,
  });
}
