class ExperienceModel {
  final String id;
  final String name;
  final String level;

  final double confidence;
  final int yearsExperience;

  final List<String> impacts;
  final List<String> highlights;
  final List<String> linkedProjects;

  const ExperienceModel({
    required this.id,
    required this.name,
    required this.level,
    required this.confidence,
    required this.yearsExperience,
    required this.impacts,
    required this.highlights,
    required this.linkedProjects,
  });
}
