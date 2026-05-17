// lib/constants/app_constants.dart
// Shared data and design tokens used across all screens

import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF12121F);
  static const surface = Color(0xFF1E1E2E);
  static const surfaceVariant = Color(0xFF252538);
  static const primary = Color(0xFF6C63FF);
  static const secondary = Color(0xFF03DAC6);
  static const accent = Color(0xFFFF6584);
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFB0B0C8);
  static const textMuted = Color(0xFF8A8AA8);
  static const divider = Color(0xFF2E2E45);
}

// ─── Student / Portfolio Data ─────────────────────────────────────────────────

class StudentData {
  static const String name = 'Alex Rahman';
  static const String title = 'Flutter Developer & UI Designer';
  static const String university = 'University of Engineering & Technology';
  static const String email = 'alex.rahman@example.com';
  static const String phone = '+92 300 1234567';
  static const String linkedin = 'linkedin.com/in/alexrahman';
  static const String github = 'github.com/alexrahman';
  static const String aboutMe =
      'Passionate mobile developer with a love for crafting beautiful and '
      'performant Flutter applications. Currently interning at Abdanix Solutions, '
      'building real-world skills in cross-platform mobile development.';

  static const List<SkillData> skills = [
    SkillData(
      name: 'Flutter & Dart',
      level: 0.80,
      description:
          'Building beautiful, natively compiled mobile apps for iOS and Android '
          'from a single codebase using Flutter and Dart.',
      icon: Icons.phone_android,
      tags: ['Widgets', 'State Management', 'Navigation', 'Animations'],
      color: Color(0xFF6C63FF),
    ),
    SkillData(
      name: 'UI / UX Design',
      level: 0.70,
      description:
          'Creating user-centered interfaces with a strong focus on usability, '
          'visual hierarchy, and consistent design systems.',
      icon: Icons.design_services,
      tags: ['Figma', 'Prototyping', 'Design Systems', 'Accessibility'],
      color: Color(0xFF03DAC6),
    ),
    SkillData(
      name: 'Firebase',
      level: 0.65,
      description:
          'Integrating Firebase services including Firestore, Authentication, '
          'Cloud Storage, and Cloud Functions.',
      icon: Icons.local_fire_department,
      tags: ['Firestore', 'Auth', 'Storage', 'Functions'],
      color: Color(0xFFFF9800),
    ),
    SkillData(
      name: 'REST APIs & JSON',
      level: 0.72,
      description:
          'Consuming REST APIs, parsing JSON responses, and integrating '
          'third-party services into Flutter apps.',
      icon: Icons.api,
      tags: ['HTTP', 'JSON', 'Dio', 'http package'],
      color: Color(0xFF4CAF50),
    ),
    SkillData(
      name: 'Git & GitHub',
      level: 0.75,
      description:
          'Version control with Git, collaborative workflows, branching '
          'strategies, pull requests, and code reviews.',
      icon: Icons.code,
      tags: ['Git', 'GitHub', 'Branches', 'CI/CD'],
      color: Color(0xFFFF6584),
    ),
  ];

  static const List<ProjectData> projects = [
    ProjectData(
      title: 'E-Commerce App',
      subtitle: 'Full-featured shopping application',
      description:
          'A complete Flutter e-commerce application with product listings, '
          'cart management, user authentication via Firebase, order tracking, '
          'and a clean checkout flow. Supports both light and dark themes.',
      tech: ['Flutter', 'Firebase', 'Provider', 'Stripe'],
      icon: Icons.shopping_bag,
      color: Color(0xFF6C63FF),
      duration: '6 weeks',
      status: 'Completed',
    ),
    ProjectData(
      title: 'Weather Dashboard',
      subtitle: 'Real-time weather forecasting app',
      description:
          'Beautiful weather app consuming the OpenWeatherMap API. Features '
          'animated weather icons, 7-day forecast, hourly breakdown, location '
          'detection, and custom city search.',
      tech: ['Flutter', 'REST API', 'Lottie', 'Geolocator'],
      icon: Icons.wb_cloudy,
      color: Color(0xFF03DAC6),
      duration: '3 weeks',
      status: 'Completed',
    ),
    ProjectData(
      title: 'Task Manager',
      subtitle: 'Productivity & to-do application',
      description:
          'Feature-rich task management app with categories, priorities, '
          'due dates, reminders via local notifications, and progress analytics. '
          'Uses Hive for local storage.',
      tech: ['Flutter', 'Hive', 'BLoC', 'Local Notifications'],
      icon: Icons.check_circle,
      color: Color(0xFFFF9800),
      duration: '4 weeks',
      status: 'In Progress',
    ),
  ];
}

// ─── Data Models ──────────────────────────────────────────────────────────────

class SkillData {
  final String name;
  final double level; // 0.0 – 1.0
  final String description;
  final IconData icon;
  final List<String> tags;
  final Color color;

  const SkillData({
    required this.name,
    required this.level,
    required this.description,
    required this.icon,
    required this.tags,
    required this.color,
  });
}

class ProjectData {
  final String title;
  final String subtitle;
  final String description;
  final List<String> tech;
  final IconData icon;
  final Color color;
  final String duration;
  final String status;

  const ProjectData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tech,
    required this.icon,
    required this.color,
    required this.duration,
    required this.status,
  });
}
