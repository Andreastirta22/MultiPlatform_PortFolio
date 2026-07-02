import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/models/project_model.dart';

class NeoProjectCard extends StatelessWidget {
  final ProjectModel project;
  const NeoProjectCard({super.key, required this.project});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff171A22), Color(0xff0E1118)],
        ),
        border: Border.all(color: Colors.white.withValues(alpha: .06)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .35),
            blurRadius: 40,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Column(
          children: [
            /// HERO
            Expanded(
              flex: 52,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff050711),
                      Color(0xff090B15),
                      Color(0xff0D1017),
                    ],
                  ),
                  border: Border(bottom: BorderSide(color: Color(0x10FFFFFF))),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withValues(alpha: .12),
                              blurRadius: 120,
                              spreadRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 58, 40, 50),
                      child: Image.network(project.image, fit: BoxFit.contain),
                    ),
                    Positioned(
                      top: 22,
                      left: 22,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: Colors.white.withValues(alpha: .03),
                          border: Border.all(color: Colors.white12),
                        ),
                        child: Text(
                          project.category.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 11,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// CONTENT
            Expanded(
              flex: 48,
              child: LayoutBuilder(
                builder: (_, constraints) {
                  final compact = constraints.maxHeight < 280;
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff141821), Color(0xff0C1018)],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(compact ? 18 : 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// TITLE
                          Text(
                            project.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: compact ? 24 : 32,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),

                          /// SUBTITLE
                          Text(
                            project.subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: compact ? 14 : 16,

                              color: Colors.grey[400],
                            ),
                          ),

                          if (!compact) ...[
                            const SizedBox(height: 12),

                            Text(
                              project.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.7,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: project.techs
                                .take(compact ? 2 : 3)
                                .map(_chip)
                                .toList(),
                          ),
                          const Spacer(),
                          Divider(color: Colors.white.withValues(alpha: .08)),
                          const SizedBox(height: 12),
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
                              Container(
                                width: compact ? 38 : 36,
                                height: compact ? 38 : 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withValues(alpha: .04),
                                  border: Border.all(color: Colors.white12),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 18,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Colors.white.withValues(alpha: .04),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        tech,
        style: const TextStyle(color: Colors.white70, fontSize: 11),
      ),
    );
  }
}
