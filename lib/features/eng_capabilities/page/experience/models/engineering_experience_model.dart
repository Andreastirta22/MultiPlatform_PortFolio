import 'package:flutter/foundation.dart';

@immutable
class ExperienceModel {
  final String id;

  // Identity
  final String company;
  final String role;

  // Timeline
  final String period;
  final String type;

  // Story
  final String summary;

  // Engineering Maturity
  final String level;
  final double confidence;
  final int yearsExperience;

  // Engineering Evidence
  final List<String> impacts;
  final List<String> highlights;

  // Related Work
  final List<String> linkedProjects;

  const ExperienceModel({
    required this.id,
    required this.company,
    required this.role,
    required this.period,
    required this.type,
    required this.summary,
    required this.level,
    required this.confidence,
    required this.yearsExperience,
    required this.impacts,
    required this.highlights,
    required this.linkedProjects,
  });
}
