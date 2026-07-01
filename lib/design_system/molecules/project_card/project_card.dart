import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> tags;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tags,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
