// lib/screens/profile_screen.dart
// Displays student profile: bio, skills, education
// Receives [studentName] as a navigation argument from HomeScreen

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/custom_widgets.dart';
import 'details_screen.dart';

class ProfileScreen extends StatelessWidget {
  /// Passed from HomeScreen via Navigator.push to demonstrate data passing
  final String studentName;

  const ProfileScreen({super.key, required this.studentName});

  // ── Navigate to skill details ──────────────────────────────────────────────
  void _viewSkillDetails(BuildContext context, SkillData skill, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailsScreen(
          skill: skill,
          heroTag: 'skill_$index',
          // Pass the student name along further
          passThroughName: studentName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          // Navigator.pop to go back
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ── Avatar + Name + Title ────────────────────────────────────────
          _buildProfileHeader(context),

          const GradientDivider(),

          // ── About ────────────────────────────────────────────────────────
          const SectionTitle(title: 'About Me'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.2),
              ),
            ),
            child: Text(
              StudentData.aboutMe,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.7,
              ),
            ),
          ),

          const GradientDivider(),

          // ── Education / Info ─────────────────────────────────────────────
          const SectionTitle(title: 'Education & Info'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                InfoRow(
                  icon: Icons.school_rounded,
                  label: 'UNIVERSITY',
                  value: StudentData.university,
                  iconColor: AppColors.secondary,
                ),
                const Divider(color: AppColors.divider, height: 20),
                InfoRow(
                  icon: Icons.location_on_rounded,
                  label: 'LOCATION',
                  value: 'Pakistan',
                  iconColor: AppColors.accent,
                ),
                const Divider(color: AppColors.divider, height: 20),
                InfoRow(
                  icon: Icons.business_rounded,
                  label: 'INTERNSHIP',
                  value: 'Abdanix Solutions',
                  iconColor: const Color(0xFFFF9800),
                ),
              ],
            ),
          ),

          const GradientDivider(),

          // ── Skills ───────────────────────────────────────────────────────
          const SectionTitle(title: 'Skills'),
          const SizedBox(height: 6),
          const Text(
            'Tap any skill card to see full details.',
            style: TextStyle(fontSize: 12, color: AppColors.textMuted),
          ),
          const SizedBox(height: 12),

          ...List.generate(StudentData.skills.length, (i) {
            final skill = StudentData.skills[i];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SkillProgressCard(
                name: skill.name,
                level: skill.level,
                icon: skill.icon,
                color: skill.color,
                onTap: () => _viewSkillDetails(context, skill, i),
              ),
            );
          }),

          const SizedBox(height: 24),

          // ── Passed data banner ───────────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline,
                    color: AppColors.primary, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    // Confirming data was received via navigation
                    'Viewing profile for: $studentName',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // ── Header widget ──────────────────────────────────────────────────────────

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        // Gradient avatar
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.secondary],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.45),
                blurRadius: 24,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const Icon(
            Icons.person_rounded,
            color: Colors.white,
            size: 60,
          ),
        ),
        const SizedBox(height: 16),
        // Name (from passed data)
        Text(
          studentName,
          style: const TextStyle(
            fontFamily: 'Georgia',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          StudentData.title,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.secondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),
        // Tech chips
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: ['Flutter', 'Dart', 'Firebase', 'UI Design']
              .map((t) => SkillChip(label: t, color: AppColors.primary))
              .toList(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
