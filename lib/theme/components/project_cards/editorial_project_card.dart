import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/projects/models/project_model.dart';

class EditorialProjectCard extends StatelessWidget {
  final ProjectModel project;
  const EditorialProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.border),
      ),
      child: ClipRect(
        child: Column(
          children: [
            /// IMAGE
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(36),
                    child: Image.network(project.image, fit: BoxFit.contain),
                  ),
                  Positioned(
                    top: 24,
                    left: 24,
                    child: Text(
                      project.category.toUpperCase(),
                      style: TextStyle(
                        color: colors.textSecondary,
                        fontSize: 11,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 24,
                    right: 24,
                    child: Text(
                      project.year,
                      style: TextStyle(
                        color: colors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// CONTENT
            Expanded(
              flex: 4,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final compact = constraints.maxHeight < 250;
                  return Padding(
                    padding: EdgeInsets.all(compact ? 24 : 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: compact ? 30 : 42,
                            height: 1.05,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          project.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: compact ? 14 : 16),
                        ),
                        SizedBox(height: compact ? 12 : 20),
                        Expanded(
                          child: Text(
                            project.description,
                            maxLines: compact ? 2 : 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: compact ? 13 : 15,
                              height: 1.8,
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 10,
                          children: project.techs
                              .take(compact ? 2 : 4)
                              .map(
                                (e) => Text(
                                  e.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: compact ? 10 : 11,
                                    letterSpacing: 1.8,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: compact ? 10 : 18),
                        Divider(),
                        SizedBox(height: compact ? 8 : 12),
                        Row(
                          children: [
                            Text(
                              "READ FEATURE",
                              style: TextStyle(
                                fontSize: compact ? 11 : 12,
                                letterSpacing: 2,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward, size: 18),
                          ],
                        ),
                      ],
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
}
