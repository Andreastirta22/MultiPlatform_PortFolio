import 'package:portfolio/features/eng_capabilities/model/engineering_platform.dart';

class LanguageModel {
  final String id;
  final String name;
  final String description;
  final String level;

  final double confidence;
  final int yearsExperience;

  final List<EngineeringPlatform> platforms;
  final List<String> tags;
  final List<String> linkedProjects;

  final String iconAsset;

  const LanguageModel({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.confidence,
    required this.yearsExperience,
    required this.platforms,
    required this.tags,
    required this.linkedProjects,
    required this.iconAsset,
  });
}
