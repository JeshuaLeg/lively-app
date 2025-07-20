import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/navigation/app_router.dart';

class FocusScreen extends ConsumerStatefulWidget {
  const FocusScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends ConsumerState<FocusScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _hasActiveSession = true; // Simulating an active Focus Fiesta session

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
              _buildTabBar(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildScheduleTab(),
                    _buildLimitsTab(),
                  ],
                ),
              ),
              if (_hasActiveSession) _buildActiveSessionBar(),
              const SizedBox(height: 80), // Space for bottom nav
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
            'Blocks',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.softWhite,
            ),
          ),
          IconButton(
            onPressed: () {
              context.push(AppConstants.settingsRoute);
            },
            icon: const Icon(
              Icons.settings,
              color: AppTheme.softWhite,
              size: 24,
            ),
            style: IconButton.styleFrom(
              backgroundColor: AppTheme.cardBackground,
              shape: const CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: AppTheme.softWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        indicatorPadding: const EdgeInsets.all(4),
        labelColor: AppTheme.primaryNavy,
        unselectedLabelColor: AppTheme.mutedGray,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        tabs: const [
          Tab(
            icon: Icon(Icons.schedule, size: 20),
            text: 'Schedule',
          ),
          Tab(
            icon: Icon(Icons.block, size: 20),
            text: 'Limits',
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_hasActiveSession) _buildActiveFocusCard(),
          const SizedBox(height: 24),
          _buildScheduledSessions(),
          const SizedBox(height: 24),
          _buildCreateScheduleCard(),
          const SizedBox(height: 24),
          _buildReloadBlocksOption(),
          const SizedBox(height: 24),
          _buildGetMoreDoneSection(),
        ],
      ),
    );
  }

  Widget _buildLimitsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App Limits',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppTheme.softWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          _buildAppLimitCard('Social Media', '1h 30m', Colors.blue),
          _buildAppLimitCard('Entertainment', '2h 0m', Colors.purple),
          _buildAppLimitCard('Games', '30m', Colors.orange),
          const SizedBox(height: 24),
          _buildAddLimitButton(),
        ],
      ),
    );
  }

  Widget _buildActiveFocusCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.gemBlue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFF8C00)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '⚡',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🎉 Focus Fiesta',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.softWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Remaining 0:19:42',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.mutedGray,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppTheme.mutedGray,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.gemTeal.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppTheme.gemTeal,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Blocking',
                      style: TextStyle(
                        color: AppTheme.gemTeal,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.gemPink.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSmallAppIcon(Icons.tiktok, Colors.black),
                    const SizedBox(width: 2),
                    _buildSmallAppIcon(Icons.discord, Colors.purple),
                    const SizedBox(width: 2),
                    _buildSmallAppIcon(Icons.download, Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      '+1',
                      style: TextStyle(
                        color: AppTheme.softWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallAppIcon(IconData icon, Color color) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 10,
      ),
    );
  }

  Widget _buildScheduledSessions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildScheduledSessionCard(
          '💻 Work Time',
          'Weekdays, 9:00 AM - 5:00 PM',
          'Starting Monday',
          Icons.laptop_mac,
        ),
        const SizedBox(height: 16),
        _buildScheduledSessionCard(
          '💎 Family time',
          'Weekdays, 6:00 PM - 7:00 PM',
          'Starting Monday',
          Icons.diamond,
        ),
      ],
    );
  }

  Widget _buildScheduledSessionCard(
    String title,
    String schedule,
    String startInfo,
    IconData icon,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.accentBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppTheme.softWhite,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.softWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  schedule,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.mutedGray,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.accentBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 12,
                        color: AppTheme.mutedGray,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        startInfo,
                        style: TextStyle(
                          color: AppTheme.mutedGray,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppTheme.mutedGray,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildCreateScheduleCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.mutedGray.withOpacity(0.2),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.accentBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.add,
              color: AppTheme.softWhite,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Create Schedule',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppTheme.softWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReloadBlocksOption() {
    return Row(
      children: [
        Text(
          'Have an issue?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.mutedGray,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            // Handle reload blocks
          },
          child: Row(
            children: [
              Icon(
                Icons.refresh,
                color: AppTheme.gemBlue,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                'Reload Blocks',
                style: TextStyle(
                  color: AppTheme.gemBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGetMoreDoneSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get More Done',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppTheme.softWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        // Add similar cards as in home screen but simplified for blocks context
        Text(
          'Create focused work sessions and block distracting apps to maximize your productivity.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.mutedGray,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildAppLimitCard(String category, String limit, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.apps,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppTheme.softWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Daily limit: $limit',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.mutedGray,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: true,
            onChanged: (value) {
              // Handle switch toggle
            },
            activeColor: AppTheme.gemBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildAddLimitButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppTheme.gemGradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: () {
          // Handle add limit
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Add App Limit',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveSessionBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF26C6DA),
            Color(0xFF00BCD4),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '🎉',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Focus Fiesta',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '⏰ 4 • 19:43',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.pause,
                    color: Color(0xFF26C6DA),
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Break',
                    style: TextStyle(
                      color: Color(0xFF26C6DA),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}