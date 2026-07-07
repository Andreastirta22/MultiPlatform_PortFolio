class CertificateModel {
  final String id;
  final String title;
  final String issuer;
  final CertificateCategory category;
  final String description;

  final DateTime issuedAt;
  final String verifyUrl;
  final String imageAsset;

  const CertificateModel({
    required this.id,
    required this.title,
    required this.issuer,
    required this.category,
    required this.issuedAt,
    required this.verifyUrl,
    required this.imageAsset,
    required this.description,
  });
}

enum CertificateCategory {
  mobile,
  backend,
  cloud,
  uiux,
  database,
  devops,
  cybersecurity,
  ai,
  softSkill,
}
