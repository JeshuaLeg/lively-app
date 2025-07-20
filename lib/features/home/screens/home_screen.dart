import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/providers/theme_provider.dart';
import '../../gems/providers/gem_provider.dart';
import '../../gems/widgets/animated_gem.dart';
import '../../gems/models/gem_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _gemAnimationController;
  late AnimationController _fadeAnimationController;
  late Animation<double> _gemRotationAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    _gemAnimationController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
    
    _fadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _gemRotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _gemAnimationController,
      curve: Curves.linear,
    ));
    
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _fadeAnimationController,
      curve: Curves.easeInOut,
    ));
    
    _fadeAnimationController.forward();
    
    // Check for daily login rewards
    _checkDailyRewards();
  }

  void _checkDailyRewards() async {
    // Wait for the screen to fully load
    await Future.delayed(const Duration(milliseconds: 1500));
    
    if (!mounted) return;
    
    // Check if this is first launch and add welcome gems
    await _addWelcomeGemsIfNeeded();
    
    // Check for daily login gems
    final gemNotifier = ref.read(gemProvider.notifier);
    final dailyGems = await gemNotifier.checkDailyReward();
    
    if (mounted && dailyGems.isNotEmpty) {
      // Show daily reward animation
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GemRewardAnimation(
          gems: dailyGems,
          message: 'Daily Login Reward!',
          onComplete: () {
            Navigator.of(context).pop();
          },
        ),
      );
    }
  }

  Future<void> _addWelcomeGemsIfNeeded() async {
    final totalGems = ref.read(totalGemsProvider);
    
    // If user has no gems, add welcome gems
    if (totalGems == 0) {
      final welcomeGems = await awardGems(ref, 'first_session');
      
      // Add a few more demo gems to showcase the system
      await awardGems(ref, 'daily_goal_reached');
      await awardGems(ref, 'focus_session_completed', metadata: {'duration': 25});
      await awardGems(ref, 'achievement_unlocked', metadata: {'type': 'milestone'});
      
      if (mounted && welcomeGems.isNotEmpty) {
        // Brief delay before showing welcome message
        await Future.delayed(const Duration(milliseconds: 500));
        
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => GemRewardAnimation(
              gems: [welcomeGems.first],
              message: 'Welcome to Lively!\nStart your focus journey.',
              onComplete: () {
                Navigator.of(context).pop();
              },
            ),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _gemAnimationController.dispose();
    _fadeAnimationController.dispose();
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
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  _buildHeader(),
                  _buildGemDisplay(),
                  _buildStatsRow(),
                  _buildFocusTimerSection(),
                  _buildGetMoreDoneSection(),
                  _buildSleepRelaxSection(),
                  const SizedBox(height: 100), // Space for bottom nav
                ],
              ),
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
            'Lively',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.softWhite,
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.gemBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppTheme.gemBlue.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.diamond,
                      color: AppTheme.gemBlue,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '101',
                      style: TextStyle(
                        color: AppTheme.gemBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  context.push(AppConstants.settingsRoute);
                },
                icon: const Icon(
                  Icons.share_outlined,
                  color: AppTheme.softWhite,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGemDisplay() {
    final gemCollection = ref.watch(gemCollectionProvider);
    final totalGems = ref.watch(totalGemsProvider);
    final totalValue = ref.watch(totalGemValueProvider);
    final recentGems = ref.watch(recentGemsProvider);
    
    // Get some featured gems to display
    final featuredGems = _getFeaturedGems(gemCollection);
    
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background gradient glow
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppTheme.gemBlue.withOpacity(0.3),
                  AppTheme.gemTeal.withOpacity(0.2),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          
          // Display user's actual gems
          if (featuredGems.isNotEmpty) ...[
            // Left gem
            if (featuredGems.length > 1)
              Positioned(
                left: 50,
                child: AnimatedGem(
                  gem: featuredGems[1],
                  size: 80,
                  animationDelay: 500,
                  onTap: () => _showGemDetails(featuredGems[1]),
                ),
              ),
            
            // Center gem (main) - show the rarest gem
            Positioned(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedGem(
                    gem: featuredGems[0],
                    size: 120,
                    animationDelay: 0,
                    showRarity: true,
                    onTap: () => _showGemDetails(featuredGems[0]),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppTheme.gemBlue.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '$totalGems Gems',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Value: $totalValue',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Right gem
            if (featuredGems.length > 2)
              Positioned(
                right: 50,
                child: AnimatedGem(
                  gem: featuredGems[2],
                  size: 70,
                  animationDelay: 1000,
                  onTap: () => _showGemDetails(featuredGems[2]),
                ),
              ),
          ] else ...[
            // Show placeholder gems if no gems earned yet
            Positioned(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white10,
                      border: Border.all(
                        color: AppTheme.gemBlue.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.diamond_outlined,
                      color: Colors.white30,
                      size: 60,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppTheme.gemBlue.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'Start focusing to earn gems!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          
          // Floating recent gems
          if (recentGems.length > 3)
            ...recentGems.skip(3).take(5).asMap().entries.map((entry) {
              final index = entry.key;
              final gem = entry.value;
              final random = _random;
              
              return Positioned(
                left: 20 + random.nextDouble() * (MediaQuery.of(context).size.width - 80),
                top: 50 + random.nextDouble() * 200,
                child: AnimatedGem(
                  gem: gem,
                  size: 25 + random.nextDouble() * 15,
                  animationDelay: index * 300.0,
                ),
              );
            }).toList(),
        ],
      ),
    );
  }
  
  final _random = math.Random();
  
  List<Gem> _getFeaturedGems(GemCollection collection) {
    if (collection.gems.isEmpty) return [];
    
    // Sort gems by rarity and value for featured display
    final sortedGems = List<Gem>.from(collection.gems)
      ..sort((a, b) {
        // First sort by rarity
        final rarityComparison = b.rarity.index.compareTo(a.rarity.index);
        if (rarityComparison != 0) return rarityComparison;
        
        // Then by value
        return b.value.compareTo(a.value);
      });
    
    return sortedGems.take(3).toList();
  }
  
  void _showGemDetails(Gem gem) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: gem.color.withOpacity(0.5),
            width: 2,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedGem(
              gem: gem,
              size: 100,
              showRarity: true,
            ),
            const SizedBox(height: 16),
            Text(
              gem.name,
              style: TextStyle(
                color: gem.color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              gem.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rarity: ${gem.rarity.name.toUpperCase()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Value: ${gem.value}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (gem.sourceAction != null) ...[
              const SizedBox(height: 8),
              Text(
                'Earned from: ${gem.sourceAction}',
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('FOCUS', '95%', AppTheme.gemGreen),
          _buildStatItem('SCREEN TIME', '41m 22s', AppTheme.softWhite),
          _buildStatItem('CULPRITS', '', AppTheme.softWhite, showIcons: true),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color, {bool showIcons = false}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppTheme.mutedGray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        if (showIcons)
          Row(
            children: [
              _buildAppIcon(Icons.facebook, Colors.blue),
              const SizedBox(width: 4),
              _buildAppIcon(Icons.message, Colors.green),
              const SizedBox(width: 4),
              _buildAppIcon(Icons.play_arrow, Colors.red),
            ],
          )
        else
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _buildAppIcon(IconData icon, Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 12,
      ),
    );
  }

  Widget _buildFocusTimerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Focus Timer',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.softWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '+ New',
                  style: TextStyle(
                    color: AppTheme.gemBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildFocusCard(
                '🎯 Get it done',
                '20m',
                const LinearGradient(
                  colors: [Color(0xFFFF7043), Color(0xFFFF5722)],
                ),
              ),
              _buildFocusCard(
                '😤 Work Sprint',
                '25m',
                const LinearGradient(
                  colors: [Color(0xFF7C4DFF), Color(0xFF673AB7)],
                ),
              ),
              _buildFocusCard(
                '📖 Reading',
                '45m',
                const LinearGradient(
                  colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
                ),
              ),
            ],
          ),
        ),
        _buildTimerControls(),
      ],
    );
  }

  Widget _buildFocusCard(String title, String duration, Gradient gradient) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
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
              duration,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerControls() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove, color: AppTheme.softWhite),
                style: IconButton.styleFrom(
                  backgroundColor: AppTheme.cardBackground,
                  shape: const CircleBorder(),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppTheme.softWhite,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      '20m',
                      style: TextStyle(
                        color: AppTheme.primaryNavy,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: AppTheme.softWhite),
                style: IconButton.styleFrom(
                  backgroundColor: AppTheme.cardBackground,
                  shape: const CircleBorder(),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE91E63), Color(0xFFAD1457)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Block',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        _buildAppIcon(Icons.facebook, Colors.blue),
                        const SizedBox(width: 2),
                        _buildAppIcon(Icons.message, Colors.green),
                        const SizedBox(width: 2),
                        _buildAppIcon(Icons.download, Colors.orange),
                      ],
                    ),
                    const Text(
                      ' +1',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppTheme.gemGradient,
              borderRadius: BorderRadius.circular(24),
            ),
            child: ElevatedButton(
              onPressed: () {
                context.push(AppConstants.sessionTimerRoute);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.play_arrow, color: Colors.white, size: 24),
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
      ),
    );
  }

  Widget _buildGetMoreDoneSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get More Done',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.softWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Maximize your productivity while staying sane.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.mutedGray,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildProductivityCard(
                '🔥 Laser Focus',
                'Your daily focus hour\nfrom 2-3pm,\nWeekdays',
                const LinearGradient(
                  colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
                ),
              ),
              _buildProductivityCard(
                '🌅 Rise & Shine',
                'Wake up without\ndistraction 6-9am\nDaily',
                const LinearGradient(
                  colors: [Color(0xFFFF7043), Color(0xFFFFAB91)],
                ),
              ),
              _buildProductivityCard(
                '💪 Creative Burst',
                'Protect your\n10-11:30am\nWeekdays',
                const LinearGradient(
                  colors: [Color(0xFF26C6DA), Color(0xFF00BCD4)],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductivityCard(String title, String description, Gradient gradient) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
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
                height: 1.3,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                '+ Add',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepRelaxSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sleep, Relax and Reset',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.softWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Sleep better, rise refreshed.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.mutedGray,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildSleepCard(
                '🌙 Wind Down',
                'Great sleep starts\nbefore bed,\n8pm-10pm',
                const LinearGradient(
                  colors: [Color(0xFFE91E63), Color(0xFFAD1457)],
                ),
              ),
              _buildSleepCard(
                '🔵 Deep Sleep',
                'Boost your sleep\'s\nrestorative qualities',
                const LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF1565C0)],
                ),
              ),
              _buildSleepCard(
                '😴 Sleep Catchup',
                '8:00-9:00am\nWeekends',
                const LinearGradient(
                  colors: [Color(0xFF8D6E63), Color(0xFF5D4037)],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSleepCard(String title, String description, Gradient gradient) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
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
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 11,
                height: 1.3,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '+ Add',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}