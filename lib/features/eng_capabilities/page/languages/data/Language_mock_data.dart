import 'package:portfolio/features/eng_capabilities/model/engineering_platform.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/models/engineering_languages_models.dart';

class LanguageMockData {
  const LanguageMockData._();

  static const List<LanguageModel> languages = [
    LanguageModel(
      id: 'flutter',
      name: 'Flutter',
      description:
          'Cross-platform framework for developing responsive mobile, web, and desktop applications.',
      level: 'Advanced',
      confidence: 94,
      yearsExperience: 2,
      platforms: [
        EngineeringPlatform.android,
        EngineeringPlatform.ios,
        EngineeringPlatform.web,
        EngineeringPlatform.windows,
      ],
      tags: ['Material 3', 'Responsive UI', 'Animation', 'Provider'],
      linkedProjects: ['CrewSync', 'Portfolio', 'Koinonia'],

      iconAsset: 'assets/icons/tech/flutter.png',
    ),

    LanguageModel(
      id: 'javascript',
      name: 'JavaScript',
      description:
          'Programming language used for modern web application development.',
      level: 'Intermediate',
      confidence: 78,
      yearsExperience: 3,
      platforms: [EngineeringPlatform.web],
      tags: ['ES6', 'DOM', 'Async'],
      linkedProjects: ['Portfolio Web'],

      iconAsset: 'assets/icons/tech/js.png',
    ),

    LanguageModel(
      id: 'typescript',
      name: 'TypeScript',
      description:
          'Strongly typed superset of JavaScript for scalable frontend development.',
      level: 'Intermediate',
      confidence: 74,
      yearsExperience: 1,
      platforms: [EngineeringPlatform.web],
      tags: ['Next.js', 'React', 'Type Safety'],
      linkedProjects: ['Portfolio Web'],

      iconAsset: 'assets/icons/tech/tsx.png',
    ),

    LanguageModel(
      id: 'php',
      name: 'PHP',
      description:
          'Backend language used for academic and information system development.',
      level: 'Intermediate',
      confidence: 72,
      yearsExperience: 2,
      platforms: [EngineeringPlatform.backend],
      tags: ['Laravel', 'REST API', 'MySQL'],
      linkedProjects: ['Academic Information System'],

      iconAsset: 'assets/icons/tech/php.png',
    ),

    LanguageModel(
      id: 'python',
      name: 'Python',
      description: 'General-purpose language for automation and scripting.',
      level: 'Learning',
      confidence: 42,
      yearsExperience: 1,
      platforms: [EngineeringPlatform.backend],
      tags: ['Automation', 'CLI'],
      linkedProjects: ['Automation Scripts'],

      iconAsset: 'assets/icons/tech/python.png',
    ),

    LanguageModel(
      id: 'firebase',
      name: 'Firebase',
      description:
          'Backend-as-a-Service used for authentication, storage, and realtime data.',
      level: 'Advanced',
      confidence: 86,
      yearsExperience: 2,
      platforms: [EngineeringPlatform.cloud],
      tags: ['Firestore', 'Authentication', 'Storage'],
      linkedProjects: ['Koinonia'],

      iconAsset: 'assets/icons/tech/firebase.png',
    ),

    LanguageModel(
      id: 'supabase',
      name: 'Supabase',
      description: 'Open-source backend platform powered by PostgreSQL.',
      level: 'Advanced',
      confidence: 88,
      yearsExperience: 1,
      platforms: [EngineeringPlatform.cloud, EngineeringPlatform.backend],
      tags: ['PostgreSQL', 'RLS', 'Realtime'],
      linkedProjects: ['CrewSync'],

      iconAsset: 'assets/icons/tech/supabase.png',
    ),
  ];
}
