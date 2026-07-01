import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/models/project_model.dart';

class MinimalProjectCard extends StatelessWidget {
  final ProjectModel project;

  const MinimalProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            /// IMAGE
            Expanded(
              flex: 4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(64, 48, 64, 28),
                    child: Image.network(project.image, fit: BoxFit.contain),
                  ),
                  Positioned(
                    top: 24,
                    left: 24,
                    child: Text(
                      project.category.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 24,
                    right: 24,
                    child: Text(
                      project.year,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// CONTENT
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(48, 12, 48, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        height: 1.05,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      project.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.7,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 20,
                      runSpacing: 8,
                      children: project.techs
                          .take(4)
                          .map(
                            (tech) => Text(
                              "#$tech",
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 22),
                    const SizedBox(width: 180, child: Divider(thickness: 1)),
                    const SizedBox(height: 28),
                    const Row(
                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
