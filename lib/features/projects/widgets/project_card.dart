import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/models/project_model.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() => hovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: const Color(0xff15131F),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
          boxShadow: [
            if (hovered)
              BoxShadow(
                color: Colors.white.withValues(alpha: .15),
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              p.category.toUpperCase(),
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(p.year),
            const SizedBox(height: 20),
            Text(
              p.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Text(
              p.subtitle,
              style: TextStyle(color: Colors.white.withValues(alpha: .6)),
            ),
            const SizedBox(height: 20),
            Text(
              p.description,
              style: TextStyle(
                color: Colors.white.withValues(alpha: .75),
                height: 1.6,
              ),
            ),
            const Spacer(),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: p.techs.map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: Colors.white.withValues(alpha: .05),
                  ),
                  child: Text(tech, style: const TextStyle(fontSize: 12)),
                );
              }).toList(),
            ),
            const SizedBox(width: 8),
            Row(
              children: [
                const Text("View Project"),
                const SizedBox(width: 8),
                AnimatedSlide(
                  offset: hovered ? Offset.zero : const Offset(-0.1, 0),
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.arrow_forward, size: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
