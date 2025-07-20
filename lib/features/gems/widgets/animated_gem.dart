import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/gem_model.dart';

class AnimatedGem extends StatefulWidget {
  final Gem gem;
  final double size;
  final bool floating;
  final bool rotating;
  final bool shimmer;
  final double? animationDelay;
  final VoidCallback? onTap;
  final bool showRarity;

  const AnimatedGem({
    super.key,
    required this.gem,
    this.size = 40,
    this.floating = true,
    this.rotating = true,
    this.shimmer = true,
    this.animationDelay,
    this.onTap,
    this.showRarity = false,
  });

  @override
  State<AnimatedGem> createState() => _AnimatedGemState();
}

class _AnimatedGemState extends State<AnimatedGem>
    with TickerProviderStateMixin {
  late AnimationController _floatingController;
  late AnimationController _rotationController;
  late AnimationController _shimmerController;
  late Animation<double> _floatingAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    
    _floatingController = AnimationController(
      duration: Duration(milliseconds: 2000 + (widget.animationDelay?.toInt() ?? 0)),
      vsync: this,
    );
    
    _rotationController = AnimationController(
      duration: Duration(milliseconds: 4000 + (widget.animationDelay?.toInt() ?? 0)),
      vsync: this,
    );
    
    _shimmerController = AnimationController(
      duration: Duration(milliseconds: 1500 + (widget.animationDelay?.toInt() ?? 0)),
      vsync: this,
    );

    _floatingAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _floatingController,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    ));

    _shimmerAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.easeInOut,
    ));

    if (widget.floating) {
      _floatingController.repeat(reverse: true);
    }
    
    if (widget.rotating) {
      _rotationController.repeat();
    }
    
    if (widget.shimmer) {
      _shimmerController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _rotationController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _floatingAnimation,
          _rotationAnimation,
          _shimmerAnimation,
        ]),
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, widget.floating ? math.sin(_floatingAnimation.value * 2 * math.pi) * 5 : 0),
            child: Transform.rotate(
              angle: widget.rotating ? _rotationAnimation.value : 0,
              child: Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      widget.gem.shimmerColor.withOpacity(
                        widget.shimmer ? 0.3 + (_shimmerAnimation.value * 0.7) : 0.8,
                      ),
                      widget.gem.color,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.gem.color.withOpacity(0.3),
                      blurRadius: widget.size * 0.3,
                      spreadRadius: widget.size * 0.1,
                    ),
                    if (widget.gem.rarity == GemRarity.legendary)
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: widget.size * 0.5,
                        spreadRadius: widget.size * 0.2,
                      ),
                  ],
                ),
                child: widget.showRarity
                    ? Center(
                        child: _buildRarityIndicator(),
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRarityIndicator() {
    String indicator = '';
    Color color = Colors.white;
    
    switch (widget.gem.rarity) {
      case GemRarity.common:
        return const SizedBox.shrink();
      case GemRarity.rare:
        indicator = '★';
        color = Colors.yellow;
        break;
      case GemRarity.epic:
        indicator = '★★';
        color = Colors.purple;
        break;
      case GemRarity.legendary:
        indicator = '★★★';
        color = Colors.orange;
        break;
    }
    
    return Text(
      indicator,
      style: TextStyle(
        color: color,
        fontSize: widget.size * 0.25,
        fontWeight: FontWeight.bold,
        shadows: const [
          Shadow(
            color: Colors.black,
            blurRadius: 2,
          ),
        ],
      ),
    );
  }
}

class GemRewardAnimation extends StatefulWidget {
  final List<Gem> gems;
  final VoidCallback? onComplete;
  final String? message;

  const GemRewardAnimation({
    super.key,
    required this.gems,
    this.onComplete,
    this.message,
  });

  @override
  State<GemRewardAnimation> createState() => _GemRewardAnimationState();
}

class _GemRewardAnimationState extends State<GemRewardAnimation>
    with TickerProviderStateMixin {
  late AnimationController _appearanceController;
  late AnimationController _scaleController;
  late Animation<double> _appearanceAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _appearanceController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _appearanceAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _appearanceController,
      curve: Curves.elasticOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.bounceOut,
    ));

    _startAnimation();
  }

  void _startAnimation() async {
    await _scaleController.forward();
    await _appearanceController.forward();
    
    // Wait a bit before completing
    await Future.delayed(const Duration(milliseconds: 1500));
    
    widget.onComplete?.call();
  }

  @override
  void dispose() {
    _appearanceController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([_appearanceAnimation, _scaleAnimation]),
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _appearanceAnimation.value,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF6C5CE7),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C5CE7).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.message != null) ...[
                        Text(
                          widget.message!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                      ],
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: widget.gems.asMap().entries.map((entry) {
                          final index = entry.key;
                          final gem = entry.value;
                          
                          return AnimatedGem(
                            gem: gem,
                            size: 60,
                            animationDelay: index * 200.0,
                            showRarity: true,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Gems Earned: ${widget.gems.length}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GemCounter extends StatelessWidget {
  final int count;
  final GemType? type;
  final double size;
  final bool showIcon;

  const GemCounter({
    super.key,
    required this.count,
    this.type,
    this.size = 16,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color gemColor = type != null 
        ? Gem.gemDefinitions[type]!['color'] as Color
        : const Color(0xFF6C5CE7);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon) ...[
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  gemColor.withOpacity(0.8),
                  gemColor,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: gemColor.withOpacity(0.3),
                  blurRadius: size * 0.3,
                  spreadRadius: size * 0.1,
                ),
              ],
            ),
          ),
          SizedBox(width: size * 0.3),
        ],
        Text(
          count.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class FloatingGemField extends StatefulWidget {
  final List<Gem> gems;
  final double width;
  final double height;
  final int maxVisible;

  const FloatingGemField({
    super.key,
    required this.gems,
    required this.width,
    required this.height,
    this.maxVisible = 20,
  });

  @override
  State<FloatingGemField> createState() => _FloatingGemFieldState();
}

class _FloatingGemFieldState extends State<FloatingGemField> {
  final List<Positioned> _positionedGems = [];

  @override
  void initState() {
    super.initState();
    _generatePositions();
  }

  @override
  void didUpdateWidget(FloatingGemField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.gems != oldWidget.gems) {
      _generatePositions();
    }
  }

  void _generatePositions() {
    _positionedGems.clear();
    final random = math.Random();
    final gemsToShow = widget.gems.take(widget.maxVisible).toList();
    
    for (int i = 0; i < gemsToShow.length; i++) {
      final gem = gemsToShow[i];
      final left = random.nextDouble() * (widget.width - 40);
      final top = random.nextDouble() * (widget.height - 40);
      
      _positionedGems.add(
        Positioned(
          left: left,
          top: top,
          child: AnimatedGem(
            gem: gem,
            size: 30 + random.nextDouble() * 20,
            animationDelay: i * 100.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: _positionedGems,
      ),
    );
  }
} 