import 'package:portfolio/features/eng_capabilities/model/engineering_category.dart';
import 'package:portfolio/features/eng_capabilities/model/engineering_model.dart';
import 'package:portfolio/features/eng_capabilities/model/engineering_platform.dart';

const List<EngineeringModel> engineeringData = [
  EngineeringModel(
    id: "flutter",
    name: "Flutter",
    category: EngineeringCategory.framework,
    iconAsset: "assets/icons/flutter.svg",
    description:
        "Cross-platform framework for building beautiful and high-performance applications from a single codebase.",
    level: "Production Ready",
    confidence: 95,
    years: 2,
    projects: 5,
    platformSupport: [
      EngineeringPlatform.android,
      EngineeringPlatform.ios,
      EngineeringPlatform.web,
      EngineeringPlatform.windows,
    ],
    tags: [
      "Material 3",
      "Animation",
      "Responsive",
      "Provider",
      "Clean Architecture",
    ],
    usedProjects: ["Portfolio", "CrewSync", "Koinonia"],
  ),

  EngineeringModel(
    id: "dart",
    name: "Dart",
    category: EngineeringCategory.language,
    iconAsset: "assets/icons/dart.svg",
    description:
        "Primary programming language used for Flutter application development.",
    level: "Advanced",
    confidence: 92,
    years: 2,
    projects: 5,
    platformSupport: [
      EngineeringPlatform.android,
      EngineeringPlatform.ios,
      EngineeringPlatform.web,
      EngineeringPlatform.windows,
    ],
    tags: ["OOP", "Future", "Stream", "Extension", "Null Safety"],
    usedProjects: ["Portfolio", "CrewSync", "Koinonia"],
  ),

  EngineeringModel(
    id: "typescript",
    name: "TypeScript",
    category: EngineeringCategory.language,
    iconAsset: "assets/icons/typescript.svg",
    description: "Typed JavaScript language for scalable web applications.",
    level: "Intermediate",
    confidence: 70,
    years: 1,
    projects: 1,
    platformSupport: [EngineeringPlatform.web],
    tags: ["React", "Next.js"],
    usedProjects: ["Portfolio"],
  ),

  EngineeringModel(
    id: "javascript",
    name: "JavaScript",
    category: EngineeringCategory.language,
    iconAsset: "assets/icons/javascript.svg",
    description: "Programming language for interactive web applications.",
    level: "Intermediate",
    confidence: 72,
    years: 2,
    projects: 2,
    platformSupport: [EngineeringPlatform.web],
    tags: ["ES6", "DOM", "Async"],
    usedProjects: ["Portfolio"],
  ),

  EngineeringModel(
    id: "php",
    name: "PHP",
    category: EngineeringCategory.language,
    iconAsset: "assets/icons/php.png",
    description:
        "Server-side language used for academic and CRUD-based systems.",
    level: "Intermediate",
    confidence: 65,
    years: 2,
    projects: 3,
    platformSupport: [EngineeringPlatform.web],
    tags: ["CRUD", "Authentication", "MVC"],
    usedProjects: ["Academic Information System"],
  ),

  EngineeringModel(
    id: "python",
    name: "Python",
    category: EngineeringCategory.language,
    iconAsset: "assets/icons/python.svg",
    description:
        "Programming language used for automation and learning system programming.",
    level: "Learning",
    confidence: 45,
    years: 1,
    projects: 1,
    platformSupport: [EngineeringPlatform.windows],
    tags: ["Automation", "CLI"],
    usedProjects: ["Learning Projects"],
  ),

  EngineeringModel(
    id: "firebase",
    name: "Firebase",
    category: EngineeringCategory.cloud,
    iconAsset: "assets/icons/firebase.svg",
    description:
        "Backend-as-a-Service providing Authentication, Firestore, Storage and Hosting.",
    level: "Advanced",
    confidence: 85,
    years: 2,
    projects: 3,
    platformSupport: [
      EngineeringPlatform.android,
      EngineeringPlatform.ios,
      EngineeringPlatform.web,
    ],
    tags: ["Firestore", "Authentication", "Storage", "Hosting"],
    usedProjects: ["Portfolio", "Koinonia"],
  ),

  EngineeringModel(
    id: "supabase",
    name: "Supabase",
    category: EngineeringCategory.backend,
    iconAsset: "assets/icons/supabase.svg",
    description: "Open-source backend platform powered by PostgreSQL.",
    level: "Advanced",
    confidence: 88,
    years: 1,
    projects: 2,
    platformSupport: [EngineeringPlatform.android, EngineeringPlatform.web],
    tags: ["PostgreSQL", "Realtime", "RLS", "Storage"],
    usedProjects: ["CrewSync"],
  ),
];
