class ProjectModel {
  final String title;
  final String desciption;
  final List<String> tags;
  final String github;
  final String website;
  final bool featured;

  ProjectModel({
    required this.title,
    required this.desciption,
    required this.tags,
    required this.github,
    required this.website,
    required this.featured,
  });
}
