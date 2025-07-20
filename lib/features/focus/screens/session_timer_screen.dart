import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../gems/providers/gem_provider.dart';
import '../../gems/widgets/animated_gem.dart';
import '../../gems/models/gem_model.dart';

class SessionTimerScreen extends ConsumerStatefulWidget {
  final String sessionId;
  
  const SessionTimerScreen({
    Key? key,
    required this.sessionId,
  }) : super(key: key);

  @override
  ConsumerState<SessionTimerScreen> createState() => _SessionTimerScreenState();
}

class _SessionTimerScreenState extends ConsumerState<SessionTimerScreen>
    with TickerProviderStateMixin {
  late AnimationController _galaxyAnimationController;
  late AnimationController _pulseAnimationController;
  late Animation<double> _galaxyRotationAnimation;
  late Animation<double> _galaxyScaleAnimation;
  late Animation<double> _pulseAnimation;
  
  // Session state
  bool _isRunning = true;
  int _remainingSeconds = 1199; // 19:59
  int _totalSeconds = 1200; // 20:00
  String _sessionName = '🎉 Focus Fiesta';
  
  // Session data
  final Map<String, dynamic> _sessionData = {
    'startTime': '1:33 PM',
    'endTime': '1:53 PM',
    'appGroupCount': 4,
    'breaksAllowed': true,
  };

  @override
  void initState() {
    super.initState();
    
    _galaxyAnimationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();
    
    _pulseAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _galaxyRotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _galaxyAnimationController,
      curve: Curves.linear,
    ));
    
    _galaxyScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _galaxyAnimationController,
      curve: Curves.easeInOut,
    ));
    
    _pulseAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _pulseAnimationController,
      curve: Curves.easeInOut,
    ));
    
    _startTimer();
  }

  @override
  void dispose() {
    _galaxyAnimationController.dispose();
    _pulseAnimationController.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (_isRunning && _remainingSeconds > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted && _isRunning) {
          setState(() {
            _remainingSeconds--;
            if (_remainingSeconds == 0) {
              _completeSession();
            }
          });
          _startTimer();
        }
      });
    }
  }

  void _completeSession() async {
    setState(() {
      _isRunning = false;
    });

    // Calculate session duration in minutes
    final sessionDurationMinutes = (25 * 60 - _remainingSeconds) ~/ 60;
    
    // Award gems for completing the session
    final earnedGems = await awardGems(ref, 'focus_session_completed', metadata: {
      'duration': sessionDurationMinutes,
    });

    if (mounted && earnedGems.isNotEmpty) {
      // Show gem reward animation
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GemRewardAnimation(
          gems: earnedGems,
          message: 'Focus session completed!',
          onComplete: () {
            Navigator.of(context).pop(); // Close reward dialog
            context.pop(); // Return to previous screen
          },
        ),
      );
    } else if (mounted) {
      // No gems earned, just return
      context.pop();
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
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
              Color(0xFF2E3A59),
              Color(0xFF1A1D3A),
              Color(0xFF0A0E27),
            ],
            stops: [0.0, 0.25, 0.5, 0.75, 1.0],
          ),
        ),
        child: Stack(
          children: [
            _buildGalaxyBackground(),
            SafeArea(
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: Center(
                      child: _buildTimerDisplay(),
                    ),
                  ),
                  _buildProgressTimeline(),
                  _buildControlButtons(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalaxyBackground() {
    return AnimatedBuilder(
      animation: Listenable.merge([_galaxyAnimationController, _pulseAnimationController]),
      builder: (context, child) {
        return Stack(
          children: [
            // Main galaxy spiral
            Positioned.fill(
              child: Transform.scale(
                scale: _galaxyScaleAnimation.value,
                child: Transform.rotate(
                  angle: _galaxyRotationAnimation.value * 2 * 3.14159,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 1.5,
                        colors: [
                          const Color(0xFF4FC3F7).withOpacity(0.1),
                          const Color(0xFF26C6DA).withOpacity(0.2),
                          const Color(0xFF00BCD4).withOpacity(0.1),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.3, 0.6, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Floating particles/stars
            ...List.generate(20, (index) {
              final offset = Offset(
                (index * 50.0) % 400,
                (index * 73.0) % 800,
              );
              return Positioned(
                left: offset.dx + (20 * _galaxyRotationAnimation.value),
                top: offset.dy + (15 * _galaxyRotationAnimation.value),
                child: Transform.scale(
                  scale: _pulseAnimation.value,
                  child: Container(
                    width: 2 + (index % 3),
                    height: 2 + (index % 3),
                    decoration: BoxDecoration(
                      color: AppTheme.gemColors[index % AppTheme.gemColors.length]
                          .withOpacity(0.6),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.gemColors[index % AppTheme.gemColors.length]
                              .withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            
            // Nebula-like gradients
            Positioned(
              top: 100,
              right: -50,
              child: Transform.scale(
                scale: _pulseAnimation.value * 0.8,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.gemPurple.withOpacity(0.1),
                        AppTheme.gemBlue.withOpacity(0.05),
                        Colors.transparent,
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            
            Positioned(
              bottom: 150,
              left: -30,
              child: Transform.scale(
                scale: _pulseAnimation.value * 0.9,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.gemTeal.withOpacity(0.15),
                        AppTheme.gemGreen.withOpacity(0.05),
                        Colors.transparent,
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppTheme.softWhite,
              size: 28,
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _sessionName,
                    style: TextStyle(
                      color: AppTheme.softWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.edit,
                    color: AppTheme.mutedGray,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: AppTheme.softWhite,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerDisplay() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _pulseAnimation.value,
              child: Text(
                'Remaining ${_formatTime(_remainingSeconds)}',
                style: TextStyle(
                  color: AppTheme.softWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        
        // Session info cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Expanded(
                child: _buildInfoCard(
                  icon: Icons.diamond,
                  title: 'App Group',
                  value: '${_sessionData['appGroupCount']}',
                  color: AppTheme.gemBlue,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildInfoCard(
                  icon: Icons.coffee,
                  title: 'Breaks',
                  value: '',
                  color: AppTheme.gemTeal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: AppTheme.softWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              if (value.isNotEmpty)
                Text(
                  value,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                )
              else
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.mutedGray,
                  size: 16,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressTimeline() {
    double progress = 1.0 - (_remainingSeconds / _totalSeconds);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          // Time markers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _sessionData['startTime'],
                style: TextStyle(
                  color: AppTheme.mutedGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                _sessionData['endTime'],
                style: TextStyle(
                  color: AppTheme.mutedGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Progress bar
          Stack(
            children: [
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.mutedGray.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: AppTheme.gemGradient,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Progress indicator
              Positioned(
                left: (MediaQuery.of(context).size.width - 48) * progress - 6,
                top: -4,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppTheme.gemBlue,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.softWhite,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControlButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          // Break button
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppTheme.softWhite,
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isRunning = !_isRunning;
                });
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
                    _isRunning ? Icons.pause : Icons.play_arrow,
                    color: AppTheme.primaryNavy,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _isRunning ? 'Break' : 'Resume',
                    style: TextStyle(
                      color: AppTheme.primaryNavy,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Stop button
          TextButton(
            onPressed: () {
              _showStopSessionDialog();
            },
            child: Text(
              'Stop',
              style: TextStyle(
                color: AppTheme.gemPink,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showStopSessionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppTheme.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Stop Session?',
            style: TextStyle(
              color: AppTheme.softWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Are you sure you want to stop this focus session?',
            style: TextStyle(
              color: AppTheme.mutedGray,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: AppTheme.mutedGray,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close dialog
                
                // Calculate partial session duration
                final originalDuration = 25 * 60; // 25 minutes in seconds
                final elapsedSeconds = originalDuration - _remainingSeconds;
                final elapsedMinutes = elapsedSeconds ~/ 60;
                
                // Award gems for partial session if at least 5 minutes completed
                if (elapsedMinutes >= 5) {
                  final earnedGems = await awardGems(ref, 'focus_session_completed', metadata: {
                    'duration': elapsedMinutes,
                    'partial': true,
                  });
                  
                  if (mounted && earnedGems.isNotEmpty) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => GemRewardAnimation(
                        gems: earnedGems,
                        message: 'Good effort! ${elapsedMinutes} minutes focused.',
                        onComplete: () {
                          Navigator.of(context).pop(); // Close reward dialog
                          context.pop(); // Return to previous screen
                        },
                      ),
                    );
                    return;
                  }
                }
                
                if (mounted) {
                  context.pop(); // Return to previous screen
                }
              },
              child: Text(
                'Stop',
                style: TextStyle(
                  color: AppTheme.gemPink,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}