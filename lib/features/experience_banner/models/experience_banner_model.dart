class ExperienceBannerModel {
  final String id;
  final String year;
  final String title;
  final String role;
  final String impact;
  final String desc;
  final String image;
  final String team;
  final String scale;
  final String index;

  const ExperienceBannerModel({
    required this.id,
    required this.year,
    required this.title,
    required this.role,
    required this.impact,
    required this.desc,
    required this.image,
    required this.team,
    required this.scale,
    required this.index,
  });
}

enum ExperienceType { event, internship, freelance, organization }
