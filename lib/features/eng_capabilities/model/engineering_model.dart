import 'package:portfolio/features/eng_capabilities/model/engineering_category.dart';
import 'package:portfolio/features/eng_capabilities/model/engineering_platform.dart';

class EngineeringModel {
  final String id;
  final String name;
  final EngineeringCategory category;
  final String iconAsset;
  final String description;
  final String level;
  final int confidence;
  final int years;
  final int projects;
  final List<EngineeringPlatform> platformSupport;
  final List<String> tags;
  final List<String> usedProjects;

  const EngineeringModel({
    required this.id,
    required this.name,
    required this.category,
    required this.iconAsset,
    required this.description,
    required this.level,
    required this.confidence,
    required this.years,
    required this.projects,
    required this.platformSupport,
    required this.tags,
    required this.usedProjects,
  });
}
