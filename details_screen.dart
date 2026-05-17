// lib/screens/details_screen.dart
// Displays detailed information for either a ProjectData or a SkillData item.
// Demonstrates data-passing: receives objects via constructor from Home or Profile.

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/custom_widgets.dart';

class DetailsScreen extends StatelessWidget {
  /// One of [item] or [skill] must be provided.
  final ProjectData? item;
  final SkillData? skill;
  final String heroTag;

  /// Optional name passed through from ProfileScreen → DetailsScreen
  final String? passThroughName;

  const DetailsScreen({
    super.key,
    this.item,
    this.skill,
    required this.heroTag,
    this.passThroughName,
  }) : assert(
          item != null || skill != null,
          'DetailsScreen requires either a project or a skill.',
        );

  // ── Helpers ────────────────────────────────────────────────────────────────

  String get _title => item?.title ?? skill!.name;
  String get _subtitle => item?.subtitle ?? '${(skill!.level * 100).toInt()}% proficiency';
  IconData get _icon => item?.icon ?? skill!.icon;
  Color get _color => item?.color ?? skill!.color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── Hero-like App Bar ──────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.surface,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context), // Navigator.pop
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeroHeader(),
            ),
            title: Text(_title),
          ),

          // ── Content ────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item != null) _buildProjectContent(),
                  if (skill != null) _buildSkillContent(),
                  if (passThroughName != null) ...[
                    const GradientDivider(),
                    _buildPassThroughBanner(),
                  ],
                  const SizedBox(height: 32),
                  // Back button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.arrow_back_rounded, size: 18),
                      label: const Text('Go Back'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _color,
                        shadowColor: _color.withOpacity(0.5),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Header ─────────────────────────────────────────────────────────────────

  Widget _buildHeroHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _color.withOpacity(0.3),
            AppColors.surface,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: _color.withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(color: _color.withOpacity(0.5), width: 2),
              ),
              child: Icon(_icon, color: _color, size: 36),
            ),
            const SizedBox(height: 12),
            Text(
              _subtitle,
              style: TextStyle(
                fontSize: 13,
                color: _color,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Project Content ────────────────────────────────────────────────────────

  Widget _buildProjectContent() {
    final p = item!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status + duration
        Row(
          children: [
            _StatusBadge(status: p.status, color: _color),
            const SizedBox(width: 10),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.schedule,
                      size: 14, color: AppColors.textMuted),
                  const SizedBox(width: 5),
                  Text(
                    p.duration,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        const SectionTitle(title: 'About this Project'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _color.withOpacity(0.2)),
          ),
          child: Text(
            p.description,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
        ),

        const GradientDivider(),

        SectionTitle(title: 'Tech Stack', accentColor: _color),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: p.tech
              .map((t) => SkillChip(label: t, color: _color))
              .toList(),
        ),

        const GradientDivider(),

        SectionTitle(title: 'Key Highlights', accentColor: _color),
        const SizedBox(height: 12),
        ..._projectHighlights(p).map(
          (h) => _BulletPoint(text: h, color: _color),
        ),
      ],
    );
  }

  List<String> _projectHighlights(ProjectData p) => [
        'Designed and implemented the full UI from scratch.',
        'Integrated ${p.tech.take(2).join(' and ')} for core functionality.',
        'Built with clean architecture and organized code structure.',
        'Tested on both iOS simulator and Android emulator.',
      ];

  // ── Skill Content ──────────────────────────────────────────────────────────

  Widget _buildSkillContent() {
    final s = skill!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Proficiency meter
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: s.color.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Proficiency',
                      style: TextStyle(
                          color: AppColors.textSecondary, fontSize: 14)),
                  Text(
                    '${(s.level * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: s.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: s.level,
                  backgroundColor: s.color.withOpacity(0.15),
                  valueColor: AlwaysStoppedAnimation<Color>(s.color),
                  minHeight: 10,
                ),
              ),
            ],
          ),
        ),

        const GradientDivider(),

        const SectionTitle(title: 'Description'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: s.color.withOpacity(0.2)),
          ),
          child: Text(
            s.description,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
        ),

        const GradientDivider(),

        SectionTitle(title: 'Topics & Tools', accentColor: s.color),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: s.tags
              .map((t) => SkillChip(label: t, color: s.color))
              .toList(),
        ),

        const GradientDivider(),

        SectionTitle(title: 'What I Can Do', accentColor: s.color),
        const SizedBox(height: 12),
        ..._skillHighlights(s).map(
          (h) => _BulletPoint(text: h, color: s.color),
        ),
      ],
    );
  }

  List<String> _skillHighlights(SkillData s) => [
        'Comfortable applying ${s.name} in real-world projects.',
        'Experience with ${s.tags.take(2).join(' and ')}.',
        'Continuously improving through hands-on practice.',
        'Used in multiple internship deliverables.',
      ];

  // ── Pass-through banner ────────────────────────────────────────────────────

  Widget _buildPassThroughBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.secondary.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.person_pin_rounded,
              color: AppColors.secondary, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Skill viewed by: $passThroughName',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Local helper widgets ─────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final String status;
  final Color color;

  const _StatusBadge({required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            status,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  final Color color;

  const _BulletPoint({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
