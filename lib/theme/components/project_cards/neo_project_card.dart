import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/models/project_model.dart';

class NeoProjectCard extends StatefulWidget {
  final ProjectModel project;

  const NeoProjectCard({super.key, required this.project});

  @override
  State<NeoProjectCard> createState() => _NeoProjectCardState();
}

class _NeoProjectCardState extends State<NeoProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final isMobile = MediaQuery.sizeOf(context).width < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xff0F0F14),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white.withValues(alpha: .06)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .4),
              blurRadius: 30,
              offset: const Offset(0, 16),
            ),
            if (hovered && !isMobile)
              BoxShadow(
                color: const Color(0xff6C63FF).withValues(alpha: .18),
                blurRadius: 40,
                spreadRadius: 2,
              ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Column(
            children: [
              // ================= IMAGE (50%) =================
              Expanded(
                flex: 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 250),
                        scale: hovered ? 1.05 : 1,
                        child: Image.network(p.image, fit: BoxFit.contain),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: .25),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 14,
                      left: 14,
                      child: _NeoPill(text: p.category.toUpperCase()),
                    ),

                    Positioned(
                      top: 14,
                      right: 14,
                      child: Text(
                        p.year,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .55),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ================= CONTENT (50%) =================
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        p.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .65),
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        p.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .75),
                          height: 1.5,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: p.techs.take(3).map((t) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: .04),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: .08),
                              ),
                            ),
                            child: Text(
                              t,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white70,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const Spacer(),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: hovered
                              ? const Color(0xff6C63FF).withValues(alpha: .15)
                              : Colors.white.withValues(alpha: .04),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: .08),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "View Project",
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: .85),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= PILLS =================
class _NeoPill extends StatelessWidget {
  final String text;

  const _NeoPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .04),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: .10)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          letterSpacing: 1.2,
          color: Colors.white70,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
