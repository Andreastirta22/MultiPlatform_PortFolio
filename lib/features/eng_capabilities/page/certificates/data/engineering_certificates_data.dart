import 'package:portfolio/features/eng_capabilities/page/certificates/models/engineering_certificates_model.dart';

final engineeringCertificates = [
  CertificateModel(
    id: 'bnsp-software-development',
    title: 'Software Development Competency Certificate',
    issuer: 'Badan Nasional Sertifikasi Profesi (BNSP)',
    category: CertificateCategory.backend,
    description:
        'Certified as competent in Software Development with Program Analyst qualification. Competencies include SQL, database access, algorithms, debugging, profiling, code review, unit testing, and integration testing.',
    issuedAt: DateTime(2024, 8, 22),
    verifyUrl:
        'https://ik.imagekit.io/0bdqq0ixx/certificates/sertifikat-kompetensi.pdf',
    imageAsset: 'assets/certificates/sertifikat-kompetensi.pdf',
  ),

  CertificateModel(
    id: 'pcap-python-essentials',
    title: 'PCAP: Programming Essentials in Python',
    issuer: 'Cisco Networking Academy',
    category: CertificateCategory.backend,
    description:
        'Completed Programming Essentials in Python covering algorithms, data structures, object-oriented programming, modules, packages, generators, iterators, file handling, and Python best practices.',
    issuedAt: DateTime(2022, 7, 27),
    verifyUrl:
        'https://ik.imagekit.io/0bdqq0ixx/certificates/pcap-programming-essentials.pdf',
    imageAsset: 'assets/certificates/pcap-programming-essentials.png',
  ),

  CertificateModel(
    id: 'it-bootcamp-software-development',
    title: 'IT BootCamp Software Development',
    issuer: 'Universitas Bina Sarana Informatika',
    category: CertificateCategory.backend,
    description:
        'Participated in an intensive Software Development BootCamp consisting of workshops, project implementation, and technical presentations.',
    issuedAt: DateTime(2023, 6, 21),
    verifyUrl:
        'https://ik.imagekit.io/0bdqq0ixx/certificates/pelatihan-it%20botocamp.pdf',
    imageAsset: 'assets/certificates/pelatihan-it botocamp.pdf',
  ),

  CertificateModel(
    id: 'toefl-prediction-543',
    title: 'TOEFL Prediction Test',
    issuer: 'Lembaga Bahasa Universitas Bina Sarana Informatika',
    category: CertificateCategory.softSkill,
    description:
        'Completed TOEFL Prediction Test with a total score of 543, demonstrating English proficiency in listening, structure, and reading comprehension.',
    issuedAt: DateTime(2025, 8, 25),
    verifyUrl:
        'https://ik.imagekit.io/0bdqq0ixx/certificates/sertifikat-toefl.pdf',
    imageAsset: 'assets/certificatessertifikat-toefl.pdf',
  ),
];
