import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/models/project_model.dart';

class XPProjectCard extends StatelessWidget {
  final ProjectModel project;
  const XPProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffECE9D8),
        border: Border.all(color: const Color(0xff0A246A), width: 2),
      ),
      child: Column(
        children: [
          /// TITLE BAR
          Container(
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff0A58D3), Color(0xff3D8DFF)],
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.folder, size: 16, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    project.category,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  project.year,
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),

          /// BODY
          Expanded(
            child: Column(
              children: [
                /// IMAGE
                Expanded(
                  flex: 4,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 32, 40, 16),
                        child: Image.network(
                          project.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 18,
                        left: 18,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffDCEEFF),
                            border: Border.all(color: const Color(0xff7AA6DD)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-1, -1),
                              ),
                              BoxShadow(
                                color: Color(0xffBCD3EF),
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Text(
                            project.category.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff001A44),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                        Text(
                          project.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff001A44),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          project.subtitle,
                          style: const TextStyle(
                            color: Color(0xff3B3B3B),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Expanded(
                          child: Text(
                            project.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              height: 1.6,
                              color: Color(0xff444444),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.techs
                              .take(4)
                              .map(
                                (tech) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffDCEEFF),
                                    border: Border.all(
                                      color: const Color(0xff7AA6DD),
                                    ),
                                  ),
                                  child: Text(
                                    tech,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 14),
                        Container(height: 1, color: const Color(0xffBFB9A6)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              "Open Project",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff001A44),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: const Color(0xffECE9D8),
                                border: Border.all(
                                  color: const Color(0xff7AA6DD),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                size: 14,
                                color: Color(0xff0A246A),
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
        ],
      ),
    );
  }
}
