import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import 'dart:math' as math;

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _floatingAnimationController;
  late Animation<double> _floatingAnimation;
  
  // Mock leaderboard data
  final List<Map<String, dynamic>> _leaderboardData = [
    {
      'rank': 1,
      'name': 'Sarah M.',
      'screenTime': '2h 15m',
      'avatar': '👩‍💻',
      'isCurrentUser': false,
    },
    {
      'rank': 2,
      'name': 'Alex K.',
      'screenTime': '2h 45m',
      'avatar': '👨‍🎨',
      'isCurrentUser': false,
    },
    {
      'rank': 3,
      'name': 'Me',
      'screenTime': '45m',
      'avatar': '👤',
      'isCurrentUser': true,
    },
    {
      'rank': 4,
      'name': 'Jordan L.',
      'screenTime': '3h 12m',
      'avatar': '👨‍💼',
      'isCurrentUser': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    
    _floatingAnimationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _floatingAnimation = Tween<double>(
      begin: -8,
      end: 8,
    ).animate(CurvedAnimation(
      parent: _floatingAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _floatingAnimationController.dispose();
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
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildCenterUserDisplay(),
                      _buildFindFriendsButton(),
                      _buildLeaderboardList(),
                      const SizedBox(height: 100), // Space for bottom nav
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

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Leaderboard',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.softWhite,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.cardBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: AppTheme.gemBlue,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  'Add Friends',
                  style: TextStyle(
                    color: AppTheme.gemBlue,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterUserDisplay() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          // Floating background avatars (blurred)
          Stack(
            alignment: Alignment.center,
            children: [
              // Background floating avatars
              ...List.generate(6, (index) {
                final angle = (index * 60.0) * (3.14159 / 180);
                final radius = 120.0;
                return AnimatedBuilder(
                  animation: _floatingAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        radius * math.cos(angle) + (_floatingAnimation.value * 0.5),
                        radius * math.sin(angle) + (_floatingAnimation.value * 0.3),
                      ),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.mutedGray.withOpacity(0.1),
                          border: Border.all(
                            color: AppTheme.mutedGray.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: AppTheme.mutedGray.withOpacity(0.3),
                          size: 30,
                        ),
                      ),
                    );
                  },
                );
              }),
              
              // Main user avatar
              AnimatedBuilder(
                animation: _floatingAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _floatingAnimation.value),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF26C6DA),
                            Color(0xFF00BCD4),
                          ],
                        ),
                        border: Border.all(
                          color: AppTheme.gemTeal,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.gemTeal.withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // User info
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person,
                color: AppTheme.mutedGray,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                'Just You!',
                style: TextStyle(
                  color: AppTheme.mutedGray,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'The Focused One',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.softWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 8),
          
          Text(
            'See your friends Screen Time',
            style: TextStyle(
              color: AppTheme.mutedGray,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFindFriendsButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.softWhite,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextButton(
        onPressed: () {
          // Handle find friends
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: AppTheme.primaryNavy,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              'Find Friends on Lively',
              style: TextStyle(
                color: AppTheme.primaryNavy,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardList() {
    return Column(
      children: [
        // Sample blurred entries to show what a populated leaderboard would look like
        _buildBlurredLeaderboardItem('🟡', 'Emma S.', '1h 32m'),
        _buildBlurredLeaderboardItem('⚪', 'Mike R.', '2h 45m'),
        
        // Current user entry
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppTheme.gemTeal,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.softWhite,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: AppTheme.softWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF26C6DA),
                      Color(0xFF00BCD4),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Me',
                  style: TextStyle(
                    color: AppTheme.softWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                '45m',
                style: TextStyle(
                  color: AppTheme.gemTeal,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        
        _buildBlurredLeaderboardItem('⚪', 'Lisa K.', '3h 21m'),
      ],
    );
  }

  Widget _buildBlurredLeaderboardItem(String indicator, String name, String time) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppTheme.mutedGray.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                indicator,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.mutedGray.withOpacity(0.3),
            ),
            child: Icon(
              Icons.person,
              color: AppTheme.mutedGray.withOpacity(0.6),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: AppTheme.mutedGray.withOpacity(0.7),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: AppTheme.mutedGray.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
} 