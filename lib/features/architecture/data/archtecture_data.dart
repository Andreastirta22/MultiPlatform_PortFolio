import 'package:flutter/material.dart';
import 'package:portfolio/features/architecture/models/architecture_node.dart';

final architectureNodes = [
  ArchitectureNode(
    id: "flutter",
    order: 0,
    depth: 0.0,
    title: "Flutter",
    subtitle: "Cross Platform",
    description: "Unified experience across mobile, tablet and desktop.",
    icon: Icons.phone_android,
  ),

  ArchitectureNode(
    id: "features",
    order: 1,
    depth: 0.15,
    title: "Features",
    subtitle: "Modules",
    description: "Encapsulated business domains.",
    icon: Icons.widgets,
  ),

  ArchitectureNode(
    id: "core",
    order: 2,
    depth: 0.30,
    title: "Core",
    subtitle: "Shared Layer",
    description: "Navigation, themes and utilities.",
    icon: Icons.hub,
  ),

  ArchitectureNode(
    id: "services",
    order: 3,
    depth: 0.45,
    title: "Services",
    subtitle: "Abstraction",
    description: "API and repositories.",
    icon: Icons.settings,
  ),

  ArchitectureNode(
    id: "supabase",
    order: 4,
    depth: 0.60,
    title: "Supabase",
    subtitle: "Backend",
    description: "Auth, Database and Storage.",
    icon: Icons.storage,
  ),

  ArchitectureNode(
    id: "realtime",
    order: 5,
    depth: 0.75,
    title: "Realtime",
    subtitle: "Sync",
    description: "Live data synchronization.",
    icon: Icons.sync,
  ),

  ArchitectureNode(
    id: "postgres",
    order: 6,
    depth: 0.85,
    title: "PostgreSQL",
    subtitle: "Persistence",
    description: "Relational database engine.",
    icon: Icons.dataset,
  ),

  ArchitectureNode(
    id: "rls",
    order: 7,
    depth: 1.0,
    title: "RLS",
    subtitle: "Security",
    description: "Policy based access control.",
    icon: Icons.security,
  ),
];
