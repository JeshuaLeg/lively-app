import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Summary
            _buildProgressSummary(context),
            const SizedBox(height: 24),
            
            // Achievement Categories
            _buildAchievementCategories(context),
            const SizedBox(height: 24),
            
            // Unlocked Achievements
            _buildUnlockedAchievements(context),
            const SizedBox(height: 24),
            
            // Locked Achievements
            _buildLockedAchievements(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSummary(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Progress',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildProgressItem(context, '12/25', 'Gems Collected'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildProgressItem(context, '720', 'Points Earned'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: 0.48,
              backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
            ),
            const SizedBox(height: 8),
            Text(
              '48% Complete',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressItem(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAchievementCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildCategoryCard(context, 'Focus', '⏱️', 8),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCategoryCard(context, 'Streak', '🔥', 5),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCategoryCard(context, 'Social', '👥', 3),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String emoji, int count) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$count gems',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnlockedAchievements(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Unlocked Achievements',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(5, (index) => _buildAchievementItem(context, index, true)),
      ],
    );
  }

  Widget _buildLockedAchievements(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Locked Achievements',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(3, (index) => _buildAchievementItem(context, index, false)),
      ],
    );
  }

  Widget _buildAchievementItem(BuildContext context, int index, bool isUnlocked) {
    final achievements = [
      {'title': 'First Gem', 'description': 'You installed Lively', 'emoji': '🏆'},
      {'title': 'Motivated Gem', 'description': 'Use Lively for 2 Days', 'emoji': '💎'},
      {'title': 'Driven Gem', 'description': 'Focus for 10 hours', 'emoji': '⭐'},
      {'title': 'Determined Gem', 'description': 'Focus for 50 hours', 'emoji': '🎯'},
      {'title': 'Diligent Gem', 'description': 'Focus for 100 hours', 'emoji': '💪'},
    ];

    final achievement = achievements[index % achievements.length];

    return Card(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isUnlocked 
                ? AppTheme.primaryColor.withOpacity(0.1) 
                : Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              achievement['emoji']!,
              style: TextStyle(
                fontSize: 20,
                color: isUnlocked ? null : Colors.grey,
              ),
            ),
          ),
        ),
        title: Text(
          achievement['title']!,
          style: TextStyle(
            color: isUnlocked ? null : Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          achievement['description']!,
          style: TextStyle(
            color: isUnlocked ? null : Colors.grey,
          ),
        ),
        trailing: isUnlocked
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Unlocked',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : const Icon(Icons.lock, color: Colors.grey),
      ),
    );
  }
}