class ProjectModel {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final List<String> techs;
  final String category;
  final String github;
  final String demo;
  final String year;
  final bool featured;

  const ProjectModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.techs,
    required this.category,
    required this.github,
    required this.demo,
    required this.year,
    required this.featured,
  });
}
