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

    final width = MediaQuery.sizeOf(context).width;

    final isMobile = width < 768;

    return MouseRegion(
      onEnter: (_) {
        if (!isMobile) {
          setState(() {
            hovered = true;
          });
        }
      },
      onExit: (_) {
        if (!isMobile) {
          setState(() {
            hovered = false;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,

        padding: EdgeInsets.all(isMobile ? 24 : 28),

        decoration: BoxDecoration(
          color: const Color(0xff15131F),

          borderRadius: BorderRadius.circular(isMobile ? 24 : 32),

          border: Border.all(color: Colors.white.withValues(alpha: .06)),

          boxShadow: [
            if (hovered && !isMobile)
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
            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  p.category.toUpperCase(),

                  style: TextStyle(
                    fontSize: isMobile ? 10 : 11,

                    fontWeight: FontWeight.w700,

                    letterSpacing: 1.4,
                  ),
                ),

                Text(
                  p.year,

                  style: TextStyle(color: Colors.white.withValues(alpha: .55)),
                ),
              ],
            ),

            SizedBox(height: isMobile ? 20 : 28),

            /// TITLE
            Text(
              p.title,
              style: TextStyle(
                fontSize: isMobile ? 30 : 28,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            const SizedBox(height: 12),

            /// SUBTITLE
            Text(
              p.subtitle,
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                color: Colors.white.withValues(alpha: .60),
              ),
            ),

            const SizedBox(height: 20),

            /// DESCRIPTION
            Text(
              p.description,
              maxLines: isMobile ? 3 : null,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                height: 1.6,
                color: Colors.white.withValues(alpha: .75),
              ),
            ),

            SizedBox(height: isMobile ? 24 : 40),

            /// TECH
            Wrap(
              spacing: 8,
              runSpacing: 8,

              children: p.techs.map((tech) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 10 : 12,

                    vertical: isMobile ? 5 : 6,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .05),

                    borderRadius: BorderRadius.circular(999),
                  ),

                  child: Text(
                    tech,

                    style: TextStyle(fontSize: isMobile ? 11 : 12),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Text(
                  isMobile ? "Explore" : "View Project",

                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),

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
