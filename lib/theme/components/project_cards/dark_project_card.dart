import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/models/project_model.dart';

class DarkProjectCard extends StatefulWidget {
  final ProjectModel project;

  const DarkProjectCard({super.key, required this.project});

  @override
  State<DarkProjectCard> createState() => _DarkProjectCardState();
}

class _DarkProjectCardState extends State<DarkProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 768;
    final radius = BorderRadius.circular(isMobile ? 24 : 32);

    return MouseRegion(
      onEnter: (_) {
        if (!isMobile) {
          setState(() => hovered = true);
        }
      },
      onExit: (_) {
        if (!isMobile) {
          setState(() => hovered = false);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          color: const Color(0xff15131F),
          borderRadius: radius,
          border: Border.all(color: Colors.white.withValues(alpha: .06)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .35),
              blurRadius: 40,
              offset: const Offset(0, 18),
            ),
            if (hovered && !isMobile)
              BoxShadow(
                color: Colors.white.withValues(alpha: .10),
                blurRadius: 34,
                spreadRadius: 1,
              ),
          ],
        ),

        child: ClipRRect(
          borderRadius: radius,
          child: Column(
            children: [
              /// IMAGE
              Expanded(
                flex: 5,
                child: Container(
                  color: const Color(0xff111119),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 22, 24, 20),
                        child: AnimatedScale(
                          scale: hovered ? 1.02 : 1,
                          duration: const Duration(milliseconds: 300),
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
                              Colors.black.withValues(alpha: .05),
                              Colors.black.withValues(alpha: .20),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .04),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: .10),
                            ),
                          ),
                          child: Text(
                            p.category.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.4,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Text(
                          p.year,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: .55),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// CONTENT
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TITLE
                      Text(
                        p.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 26 : 30,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 6),

                      /// SUBTITLE
                      Text(
                        p.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .60),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),

                      /// DESCRIPTION
                      Expanded(
                        child: Text(
                          p.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: .72),
                            fontSize: 13,
                            height: 1.7,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      /// TAGS
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: p.techs
                            .take(4)
                            .map(
                              (tech) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white.withValues(alpha: .04),
                                  border: Border.all(color: Colors.white12),
                                ),
                                child: Text(
                                  tech,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 14),
                      Divider(
                        color: Colors.white.withValues(alpha: .08),
                        height: 1,
                      ),
                      const SizedBox(height: 10),

                      /// FOOTER
                      Row(
                        children: [
                          const Text(
                            "View Project",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: hovered
                                  ? Colors.white.withValues(alpha: .10)
                                  : Colors.white.withValues(alpha: .05),
                              border: Border.all(color: Colors.white12),
                            ),
                            child: AnimatedSlide(
                              offset: hovered
                                  ? Offset.zero
                                  : const Offset(-.1, 0),
                              duration: const Duration(milliseconds: 200),
                              child: const Icon(
                                Icons.arrow_forward,
                                size: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
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
