import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';

class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  String _selectedPeriod = 'Today';
  
  final List<String> _periods = ['Today', 'Yesterday', 'This Week', 'Last Week'];
  
  // Sample data - in a real app, this would come from providers/services
  final Map<String, dynamic> _screenTimeData = {
    'totalTime': '41m 29s',
    'focusScore': 95,
    'pickups': 60,
    'timeOffline': '12h 47m',
    'offlinePercentage': 94,
  };
  
  final List<Map<String, dynamic>> _appUsageData = [
    {
      'name': 'Facebook',
      'icon': Icons.facebook,
      'color': Color(0xFF1877F2),
      'time': '20m 1s',
      'category': 'Distracting',
      'categoryColor': Color(0xFFE91E63),
    },
    {
      'name': 'Messages',
      'icon': Icons.message,
      'color': Color(0xFF00BF63),
      'time': '8m 24s',
      'category': 'Distracting',
      'categoryColor': Color(0xFFE91E63),
    },
    {
      'name': 'YouTube',
      'icon': Icons.play_arrow,
      'color': Color(0xFFFF0000),
      'time': '7m 6s',
      'category': 'Distracting',
      'categoryColor': Color(0xFFE91E63),
    },
    {
      'name': 'Google Maps',
      'icon': Icons.map,
      'color': Color(0xFF4285F4),
      'time': '1m 43s',
      'category': 'Neutral',
      'categoryColor': Color(0xFF26C6DA),
    },
  ];

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
                _buildScreenTimeDisplay(),
                _buildStatsRow(),
                _buildTimelineChart(),
                _buildTimeOfflineSection(),
                _buildAppUsageBreakdown(),
                const SizedBox(height: 100), // Space for bottom nav
              ],
            ),
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
            'Screen Time',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.softWhite,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppTheme.mutedGray,
                size: 20,
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectedPeriod,
                      style: TextStyle(
                        color: AppTheme.gemTeal,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppTheme.gemTeal,
                      size: 20,
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

  Widget _buildScreenTimeDisplay() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Text(
            _screenTimeData['totalTime'],
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: AppTheme.softWhite,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'SCREEN TIME TODAY',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.mutedGray,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            'MOST USED',
            '',
            showAppIcons: true,
          ),
          _buildStatItem(
            'FOCUS SCORE',
            '${_screenTimeData['focusScore']}%',
            color: AppTheme.gemGreen,
          ),
          _buildStatItem(
            'PICKUPS',
            '${_screenTimeData['pickups']}',
            color: AppTheme.softWhite,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, {Color? color, bool showAppIcons = false}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppTheme.mutedGray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 12),
        if (showAppIcons)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAppIcon(Icons.facebook, const Color(0xFF1877F2)),
              const SizedBox(width: 6),
              _buildAppIcon(Icons.message, const Color(0xFF00BF63)),
              const SizedBox(width: 6),
              _buildAppIcon(Icons.play_arrow, const Color(0xFFFF0000)),
            ],
          )
        else
          Text(
            value,
            style: TextStyle(
              color: color ?? AppTheme.softWhite,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _buildAppIcon(IconData icon, Color color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 14,
      ),
    );
  }

  Widget _buildTimelineChart() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem('PRODUCTIVE', AppTheme.gemTeal),
              const SizedBox(width: 24),
              Text('•', style: TextStyle(color: AppTheme.mutedGray)),
              const SizedBox(width: 24),
              _buildLegendItem('DISTRACTING', Color(0xFFE91E63)),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            height: 100,
            child: Row(
              children: [
                _buildTimeLabel('7 AM'),
                Expanded(child: _buildTimelineBar()),
                _buildTimeLabel('11 AM'),
                Expanded(child: _buildTimelineBar()),
                _buildTimeLabel('3 PM'),
                Expanded(child: _buildTimelineBar()),
                _buildTimeLabel('7 PM'),
                Expanded(child: _buildTimelineBar()),
                _buildTimeLabel('11 PM'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: AppTheme.mutedGray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeLabel(String time) {
    return Text(
      time,
      style: TextStyle(
        color: AppTheme.mutedGray,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildTimelineBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: List.generate(16, (index) {
          // Simulate productive vs distracting time blocks
          bool isProductive = index < 7; // Morning is more productive
          Color color = isProductive ? AppTheme.gemTeal : Color(0xFFE91E63);
          
          if (index > 12) {
            color = AppTheme.accentBlue.withOpacity(0.3); // Evening is less active
          }
          
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 1),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTimeOfflineSection() {
    return Container(
      margin: const EdgeInsets.all(24),
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
              color: AppTheme.gemTeal.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.bedtime,
              color: AppTheme.gemTeal,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time Offline',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.softWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_screenTimeData['offlinePercentage']}% of your day',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.mutedGray,
                  ),
                ),
              ],
            ),
          ),
          Text(
            _screenTimeData['timeOffline'],
            style: TextStyle(
              color: AppTheme.gemTeal,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppUsageBreakdown() {
    return Column(
      children: _appUsageData.map((app) => _buildAppUsageItem(app)).toList(),
    );
  }

  Widget _buildAppUsageItem(Map<String, dynamic> app) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: app['color'],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  app['icon'],
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  app['name'],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.softWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                app['time'],
                style: TextStyle(
                  color: Color(0xFFE91E63),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: app['categoryColor'].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  app['category'],
                  style: TextStyle(
                    color: app['categoryColor'],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: AppTheme.mutedGray,
                size: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}