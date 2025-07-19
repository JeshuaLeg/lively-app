import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Header with Lively branding and gem count
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Lively',
                            style: TextStyle(
                              color: AppTheme.primaryText,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  gradient: AppTheme.gemGradient,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.diamond, color: Colors.white, size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      '101',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.share, color: AppTheme.primaryText),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      
                      // Gem Display Section
                      const _GemDisplaySection(),
                      
                      const SizedBox(height: 40),
                      
                      // Focus Timer Section
                      const _FocusTimerSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GemDisplaySection extends StatelessWidget {
  const _GemDisplaySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Gem Display with stats
        Container(
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background gems (blurred)
              Positioned(
                left: 20,
                child: _buildGem(Colors.orange, 60),
              ),
              Positioned(
                right: 20,
                child: _buildGem(Colors.grey, 60),
              ),
              // Main center gem
              _buildGem(Colors.blue, 120),
            ],
          ),
        ),
        
        const SizedBox(height: 30),
        
        // Stats Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatColumn('FOCUS', '95%'),
            _buildStatColumn('SCREEN TIME', '41m 22s'),
            _buildStatColumn('CULPRITS', '', showApps: true),
          ],
        ),
      ],
    );
  }

  Widget _buildGem(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.8),
            color.withOpacity(0.4),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, {bool showApps = false}) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.mutedText,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        if (showApps)
          Row(
            children: [
              _buildAppIcon(Colors.blue, Icons.facebook),
              const SizedBox(width: 4),
              _buildAppIcon(Colors.green, Icons.message),
              const SizedBox(width: 4),
              _buildAppIcon(Colors.red, Icons.play_arrow),
            ],
          )
        else
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _buildAppIcon(Color color, IconData icon) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, color: Colors.white, size: 12),
    );
  }
}

class _FocusTimerSection extends StatelessWidget {
  const _FocusTimerSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Focus Timer',
          style: TextStyle(
            color: AppTheme.primaryText,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text(
              '+ New',
              style: TextStyle(
                color: AppTheme.mutedText,
                fontSize: 16,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 20),
        
        // Timer Cards Row
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildTimerCard(
                '🎯',
                'Get it done',
                '20m',
                const LinearGradient(
                  colors: [Color(0xFFFF6B35), Color(0xFFFF8E53)],
                ),
              ),
              const SizedBox(width: 16),
              _buildTimerCard(
                '👨‍💻',
                'Work Sprint',
                '25m',
                const LinearGradient(
                  colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                ),
              ),
              const SizedBox(width: 16),
              _buildTimerCard(
                '📚',
                'Reading',
                '45m',
                const LinearGradient(
                  colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 30),
        
        // Get More Done Section
        const Text(
          'Get More Done',
          style: TextStyle(
            color: AppTheme.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Maximize your productivity while staying sane.',
          style: TextStyle(
            color: AppTheme.secondaryText,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 20),
        
        // Recommendation Cards
        Row(
          children: [
            Expanded(
              child: _buildRecommendationCard(
                'Laser Focus',
                'Your daily focus hour from 2-3pm, Weekdays',
                const LinearGradient(
                  colors: [Color(0xFF134E5E), Color(0xFF71B280)],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildRecommendationCard(
                'Rise & Shine',
                'Wake up without distraction 6-9am Daily',
                const LinearGradient(
                  colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 30),
        
        // Bottom Timer Controls
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove, color: AppTheme.primaryText),
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.surfaceColor,
                shape: const CircleBorder(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    '20m',
                    style: TextStyle(
                      color: AppTheme.primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: AppTheme.primaryText),
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.surfaceColor,
                shape: const CircleBorder(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppTheme.cardBackground,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Block',
                      style: TextStyle(
                        color: AppTheme.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.block, color: Colors.red, size: 16),
                    Icon(Icons.download, color: AppTheme.primaryBlue, size: 16),
                    Text(
                      '+1',
                      style: TextStyle(
                        color: AppTheme.primaryText,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(width: 20),
        
        // Start Timer Button
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.successGreen,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Start Timer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimerCard(String emoji, String title, String duration, Gradient gradient) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(String title, String description, Gradient gradient) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '+ Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}