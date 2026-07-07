import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/controller/experience_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_card.dart';

class ExperienceTimelineNode extends StatelessWidget {
  final ExperienceModel experience;
  final ExperienceController controller;

  final bool isFirst;
  final bool isLast;

  const ExperienceTimelineNode({
    super.key,
    required this.experience,
    required this.controller,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Column(
            children: [
              Text(
                experience.period,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),

              if (!isLast)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 2,
                  height: 120,
                  color: Colors.grey,
                ),
            ],
          ),
        ),

        const SizedBox(width: 24),

        Expanded(
          child: ExperienceCard(
            experience: experience,
            onTap: () {
              controller.select(experience);
            },
          ),
        ),
      ],
    );
  }
}
