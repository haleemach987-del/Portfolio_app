// lib/screens/home_screen.dart
// Entry point of the app – greets the user and provides navigation cards

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/custom_widgets.dart';
import 'profile_screen.dart';
import 'details_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late List<Animation<Offset>> _slideAnimations;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    // Staggered slide animations for nav cards
    _slideAnimations = List.generate(4, (i) {
      final start = 0.3 + i * 0.12;
      final end = (start + 0.3).clamp(0.0, 1.0);
      return Tween<Offset>(
        begin: const Offset(0, 0.4),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _animController,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
      );
    });

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  // ── Navigation helpers ────────────────────────────────────────────────────

  void _goToProfile() {
    // Pass student name to Profile Screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProfileScreen(studentName: StudentData.name),
      ),
    );
  }

  void _goToProjects() {
    // Pass a project to Details Screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailsScreen(
          item: StudentData.projects[0],
          heroTag: 'project_0',
        ),
      ),
    );
  }

  void _goToContact() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ContactScreen()),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── Header SliverAppBar ──────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 240,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.surface,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeader(),
            ),
            title: const Text('Portfolio'),
          ),

          // ── Body ─────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome message
                    const Text(
                      'Welcome to my\ndigital portfolio.',
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Explore my skills, projects, and background.',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: 32),
                    const SectionTitle(title: 'Navigate'),
                    const SizedBox(height: 16),

                    // ── Navigation Cards ───────────────────────────────────
                    _buildNavCard(
                      index: 0,
                      title: 'Profile',
                      subtitle: 'About me, skills & education',
                      icon: Icons.person_rounded,
                      color: AppColors.primary,
                      onTap: _goToProfile,
                    ),
                    const SizedBox(height: 12),
                    _buildNavCard(
                      index: 1,
                      title: 'Projects',
                      subtitle: 'View my featured work',
                      icon: Icons.work_rounded,
                      color: AppColors.secondary,
                      onTap: _goToProjects,
                    ),
                    const SizedBox(height: 12),
                    _buildNavCard(
                      index: 2,
                      title: 'Contact',
                      subtitle: 'Get in touch with me',
                      icon: Icons.mail_rounded,
                      color: AppColors.accent,
                      onTap: _goToContact,
                    ),
                    const SizedBox(height: 12),
                    _buildNavCard(
                      index: 3,
                      title: 'Skill Details',
                      subtitle: 'Deep-dive into my tech stack',
                      icon: Icons.bar_chart_rounded,
                      color: const Color(0xFFFF9800),
                      onTap: () {
                        // Pass first skill to Details Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsScreen(
                              skill: StudentData.skills[0],
                              heroTag: 'skill_0',
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    // ── Quick Stats ────────────────────────────────────────
                    const SectionTitle(title: 'At a Glance'),
                    const SizedBox(height: 16),
                    _buildStatsRow(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Sub-widgets ───────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2A2A4A),
            AppColors.surface,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 44,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                StudentData.name,
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                StudentData.title,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.secondary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavCard({
    required int index,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SlideTransition(
      position: _slideAnimations[index],
      child: NavCard(
        title: title,
        subtitle: subtitle,
        icon: icon,
        color: color,
        onTap: onTap,
      ),
    );
  }

  Widget _buildStatsRow() {
    final stats = [
      _StatItem(value: '3+', label: 'Projects', color: AppColors.primary),
      _StatItem(value: '5', label: 'Skills', color: AppColors.secondary),
      _StatItem(value: '3', label: 'Screens', color: AppColors.accent),
    ];

    return Row(
      children: stats
          .map(
            (s) => Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: s == stats.last ? 0 : 12,
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: s.color.withOpacity(0.25)),
                ),
                child: Column(
                  children: [
                    Text(
                      s.value,
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: s.color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      s.label,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _StatItem {
  final String value;
  final String label;
  final Color color;
  const _StatItem(
      {required this.value, required this.label, required this.color});
}
