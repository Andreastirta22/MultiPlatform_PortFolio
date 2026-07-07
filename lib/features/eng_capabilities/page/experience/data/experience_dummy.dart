import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';

final List<ExperienceModel> experienceDummy = [
  ExperienceModel(
    id: 'crewsync',
    company: 'CrewSync',
    role: 'Flutter Developer',
    period: '2025',
    type: 'SaaS Platform',
    summary:
        'Building workforce management platform with scalable mobile architecture.',
    level: 'Advanced',
    confidence: 0.85,
    yearsExperience: 1,
    impacts: [
      'Designed feature-based Flutter architecture',
      'Implemented role-based workflow system',
      'Integrated Supabase backend with PostgreSQL',
    ],
    highlights: [
      'Flutter',
      'Supabase',
      'PostgreSQL',
      'Row Level Security',
      'GoRouter',
    ],
    linkedProjects: ['CrewSync Mobile Application'],
  ),

  ExperienceModel(
    id: 'koinonia',
    company: 'Koinonia',
    role: 'Mobile Application Developer',
    period: '2024',
    type: 'Mobile Application',
    summary:
        'Developed mobile applications using Flutter and the Firebase ecosystem.',
    level: 'Intermediate',
    confidence: 0.75,
    yearsExperience: 1,
    impacts: [
      'Created reusable Flutter components',
      'Integrated Firebase Authentication and Firestore',
      'Improved application structure and maintainability',
    ],
    highlights: ['Flutter', 'Firebase', 'Firestore', 'Mobile UI'],
    linkedProjects: ['Koinonia Mobile App'],
  ),

  ExperienceModel(
    id: 'learning',
    company: 'Personal Engineering Journey',
    role: 'Flutter Developer Learning Path',
    period: '2023',
    type: 'Self Development',
    summary:
        'Built strong software engineering fundamentals through continuous practice and personal projects.',
    level: 'Foundation',
    confidence: 0.65,
    yearsExperience: 1,
    impacts: [
      'Learned Flutter fundamentals',
      'Practiced state management patterns',
      'Built multiple experimental applications',
    ],
    highlights: [
      'Dart',
      'Flutter Widgets',
      'State Management',
      'Clean Architecture',
    ],
    linkedProjects: ['NATA Learning Project', 'Todo Assistant'],
  ),
];
