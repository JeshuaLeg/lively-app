import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../gems/providers/gem_provider.dart';
import '../../gems/widgets/animated_gem.dart';
import '../../gems/models/gem_model.dart';

class AchievementsScreen extends ConsumerStatefulWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends ConsumerState<AchievementsScreen>
    with TickerProviderStateMixin {
  late AnimationController _gemAnimationController;
  late Animation<double> _gemFloatingAnimation;
  String _selectedPeriod = 'Week';
  
  final List<String> _periods = ['Week', 'Month', 'Lifetime'];
  
  // Sample user data
  final Map<String, dynamic> _userData = {
    'username': 'mrbuff',
    'rank': 'Top 90%',
    'dayStreak': 101,
    'focusHours': 3634,
    'avgScreenTime': '3 hr, 41 min',
    'awakeTimePercentage': 23,
    'shareRewardCount': 0,
  };
  
  // Gem collection data
  final List<Map<String, dynamic>> _gemCollection = [
    {'color': Color(0xFF1E3A8A), 'type': 'Sapphire', 'unlocked': true},
    {'color': Color(0xFFFFD700), 'type': 'Topaz', 'unlocked': true},
    {'color': Color(0xFFDC2626), 'type': 'Ruby', 'unlocked': true},
    {'color': Color(0xFFF3F4F6), 'type': 'Pearl', 'unlocked': true},
    {'color': Color(0xFF059669), 'type': 'Emerald', 'unlocked': true},
    {'color': Color(0xFF10B981), 'type': 'Jade', 'unlocked': true},
    {'color': Color(0xFF3B82F6), 'type': 'Aquamarine', 'unlocked': false},
  ];
  
  // Weekly usage data for chart
  final List<Map<String, dynamic>> _weeklyData = [
    {'day': 'Sat', 'hours': 2.5, 'color': AppTheme.gemTeal},
    {'day': 'Sun', 'hours': 3.0, 'color': AppTheme.gemTeal},
    {'day': 'Mon', 'hours': 2.8, 'color': AppTheme.gemTeal},
    {'day': 'Tue', 'hours': 4.2, 'color': AppTheme.gemBlue},
    {'day': 'Wed', 'hours': 5.1, 'color': AppTheme.gemBlue},
    {'day': 'Thu', 'hours': 4.8, 'color': AppTheme.gemBlue},
    {'day': 'Fri', 'hours': 3.9, 'color': AppTheme.gemBlue},
  ];

  @override
  void initState() {
    super.initState();
    
    _gemAnimationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _gemFloatingAnimation = Tween<double>(
      begin: -5,
      end: 5,
    ).animate(CurvedAnimation(
      parent: _gemAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _gemAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF1A1D3A),
              Color(0xFF0A0E27),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                _buildGemCollection(),
                _buildAchievementCards(),
                _buildTimePeriodSelector(),
                _buildStatsSection(),
                _buildWeeklyChart(),
                _buildShareRewardsSection(),
                const SizedBox(height: 100), // Space for bottom nav
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // User avatar
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.polygon,
              sides: 6,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF26C6DA),
                  Color(0xFF00BCD4),
                ],
              ),
              border: Border.all(
                color: AppTheme.gemTeal,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          
          // Username
          Text(
            _userData['username'],
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.softWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          
          // Rank badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.gemOrange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.gemOrange.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.emoji_events,
                  color: AppTheme.gemOrange,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  _userData['rank'],
                  style: TextStyle(
                    color: AppTheme.gemOrange,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: AppTheme.softWhite,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGemCollection() {
    final gemCollection = ref.watch(gemCollectionProvider);
    final totalGems = ref.watch(totalGemsProvider);
    final totalValue = ref.watch(totalGemValueProvider);
    final rareGems = ref.watch(rareGemsCountProvider);
    
    // Get featured gems to display (different types)
    final featuredGems = _getFeaturedGemsForDisplay(gemCollection);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          // Stats row
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.cardBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.gemBlue.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('Total Gems', totalGems.toString(), AppTheme.gemBlue),
                _buildStatColumn('Total Value', totalValue.toString(), AppTheme.gemGreen),
                _buildStatColumn('Rare Gems', rareGems.toString(), AppTheme.gemPurple),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Gem display
          Container(
            height: 120,
            child: featuredGems.isNotEmpty
                ? FloatingGemField(
                    gems: gemCollection.gems,
                    width: MediaQuery.of(context).size.width - 48,
                    height: 120,
                    maxVisible: 15,
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.diamond_outlined,
                          color: AppTheme.mutedGray,
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Start focusing to collect gems!',
                          style: TextStyle(
                            color: AppTheme.mutedGray,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: AppTheme.mutedGray,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  List<Gem> _getFeaturedGemsForDisplay(GemCollection collection) {
    if (collection.gems.isEmpty) return [];
    
    // Get one gem of each type if available
    final featuredGems = <Gem>[];
    for (final type in GemType.values) {
      final gemsOfType = collection.getGemsByType(type);
      if (gemsOfType.isNotEmpty) {
        // Get the rarest gem of this type
        gemsOfType.sort((a, b) => b.rarity.index.compareTo(a.rarity.index));
        featuredGems.add(gemsOfType.first);
      }
    }
    
    return featuredGems;
  }

  Widget _buildAchievementCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildAchievementCard(
              '101',
              'DAY STREAK',
              '🔥',
              const Color(0xFFFFD700),
              'Disciplined',
              101,
              150,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildAchievementCard(
              '3,634',
              'FOCUS HOURS',
              '⏳',
              AppTheme.gemTeal,
              'Mythical',
              3670,
              5000,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(
    String value,
    String label,
    String emoji,
    Color color,
    String achievementName,
    int current,
    int target,
  ) {
    double progress = current / target;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.softWhite,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          
          // Progress section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.accentBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppTheme.mutedGray,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      achievementName,
                      style: TextStyle(
                        color: AppTheme.softWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppTheme.mutedGray.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$current/$target ${label.toLowerCase()}',
                  style: TextStyle(
                    color: AppTheme.mutedGray,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePeriodSelector() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: _periods.map((period) {
          bool isSelected = period == _selectedPeriod;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPeriod = period;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.softWhite : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  period,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? AppTheme.primaryNavy : AppTheme.mutedGray,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _userData['avgScreenTime'],
                style: TextStyle(
                  color: AppTheme.softWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Avg Screen Time',
                style: TextStyle(
                  color: AppTheme.mutedGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'AWAKE TIME',
                style: TextStyle(
                  color: AppTheme.mutedGray,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                '${_userData['awakeTimePercentage']}%',
                style: TextStyle(
                  color: AppTheme.softWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart() {
    double maxHours = _weeklyData.map((d) => d['hours'] as double).reduce((a, b) => a > b ? a : b);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _weeklyData.map((data) {
                double height = (data['hours'] as double) / maxHours;
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 120 * height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                data['color'],
                                data['color'].withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: _weeklyData.map((data) {
              return Expanded(
                child: Text(
                  data['day'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.mutedGray,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          
          // Time scale
          Row(
            children: [
              const Icon(
                Icons.keyboard_arrow_left,
                color: AppTheme.mutedGray,
                size: 20,
              ),
              const Spacer(),
              Text(
                'Last 7 Days',
                style: TextStyle(
                  color: AppTheme.mutedGray,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_right,
                color: AppTheme.mutedGray,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShareRewardsSection() {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Share Lively, Get Rewards',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.softWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Invite friends to unlock exclusive gems',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.mutedGray,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.people,
                color: AppTheme.mutedGray,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                '${_userData['shareRewardCount']}',
                style: TextStyle(
                  color: AppTheme.softWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}