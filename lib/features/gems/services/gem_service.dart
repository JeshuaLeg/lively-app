import 'dart:convert';
import 'dart:math' as math;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/gem_model.dart';

class GemService {
  static const String _gemsKey = 'user_gems';
  static const String _lastEarnDateKey = 'last_gem_earn_date';
  static const String _totalFocusTimeKey = 'total_focus_time';
  static const String _dailyStreakKey = 'daily_streak';

  Future<void> saveGems(List<Gem> gems) async {
    final prefs = await SharedPreferences.getInstance();
    final gemsJson = gems.map((gem) => gem.toJson()).toList();
    await prefs.setString(_gemsKey, jsonEncode(gemsJson));
  }

  Future<List<Gem>> loadGems() async {
    final prefs = await SharedPreferences.getInstance();
    final gemsString = prefs.getString(_gemsKey);
    
    if (gemsString == null) {
      return [];
    }

    final gemsJson = jsonDecode(gemsString) as List;
    return gemsJson.map((json) => Gem.fromJson(json)).toList();
  }

  Future<void> saveStats({
    int? totalFocusTime,
    int? dailyStreak,
    DateTime? lastEarnDate,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    
    if (totalFocusTime != null) {
      await prefs.setInt(_totalFocusTimeKey, totalFocusTime);
    }
    if (dailyStreak != null) {
      await prefs.setInt(_dailyStreakKey, dailyStreak);
    }
    if (lastEarnDate != null) {
      await prefs.setString(_lastEarnDateKey, lastEarnDate.toIso8601String());
    }
  }

  Future<Map<String, dynamic>> loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    
    final totalFocusTime = prefs.getInt(_totalFocusTimeKey) ?? 0;
    final dailyStreak = prefs.getInt(_dailyStreakKey) ?? 0;
    final lastEarnDateString = prefs.getString(_lastEarnDateKey);
    final lastEarnDate = lastEarnDateString != null 
        ? DateTime.parse(lastEarnDateString) 
        : null;

    return {
      'totalFocusTime': totalFocusTime,
      'dailyStreak': dailyStreak,
      'lastEarnDate': lastEarnDate,
    };
  }

  /// Earn gems based on different actions
  Future<List<Gem>> earnGemsForAction(String action, {Map<String, dynamic>? metadata}) async {
    final earnedGems = <Gem>[];
    
    switch (action) {
      case 'focus_session_completed':
        final duration = metadata?['duration'] ?? 25; // minutes
        earnedGems.addAll(_generateFocusSessionGems(duration));
        break;
        
      case 'daily_goal_reached':
        earnedGems.add(_generateDailyGoalGem());
        break;
        
      case 'weekly_streak':
        final streakDays = metadata?['streakDays'] ?? 7;
        earnedGems.addAll(_generateStreakGems(streakDays));
        break;
        
      case 'achievement_unlocked':
        final achievementType = metadata?['type'] ?? 'general';
        earnedGems.add(_generateAchievementGem(achievementType));
        break;
        
      case 'app_limit_respected':
        earnedGems.add(_generateAppLimitGem());
        break;
        
      case 'first_session':
        earnedGems.add(_generateWelcomeGem());
        break;
        
      case 'perfect_week':
        earnedGems.addAll(_generatePerfectWeekGems());
        break;
    }

    // Save the new gems
    if (earnedGems.isNotEmpty) {
      final existingGems = await loadGems();
      final allGems = [...existingGems, ...earnedGems];
      await saveGems(allGems);
    }

    return earnedGems;
  }

  List<Gem> _generateFocusSessionGems(int duration) {
    final gems = <Gem>[];
    final random = math.Random();

    // Base gem for completing session
    if (duration >= 15) {
      final gemType = _getRandomGemType(random);
      final rarity = _calculateFocusRarity(duration, random);
      
      gems.add(Gem.create(
        type: gemType,
        rarity: rarity,
        sourceAction: 'Focus session completed ($duration min)',
      ));
    }

    // Bonus gems for longer sessions
    if (duration >= 60) {
      gems.add(Gem.create(
        type: GemType.diamond,
        rarity: GemRarity.rare,
        sourceAction: 'Extended focus session bonus',
      ));
    }

    if (duration >= 120) {
      gems.add(Gem.create(
        type: GemType.opal,
        rarity: GemRarity.epic,
        sourceAction: 'Deep work session bonus',
      ));
    }

    return gems;
  }

  Gem _generateDailyGoalGem() {
    final random = math.Random();
    return Gem.create(
      type: _getRandomGemType(random),
      rarity: _getWeightedRarity(random, rareBias: true),
      sourceAction: 'Daily goal achieved',
    );
  }

  List<Gem> _generateStreakGems(int streakDays) {
    final gems = <Gem>[];
    final random = math.Random();

    // Base streak gem
    gems.add(Gem.create(
      type: GemType.emerald,
      rarity: _calculateStreakRarity(streakDays),
      sourceAction: '$streakDays day streak',
    ));

    // Special milestone gems
    if (streakDays == 7) {
      gems.add(Gem.create(
        type: GemType.sapphire,
        rarity: GemRarity.epic,
        sourceAction: 'First week streak milestone',
      ));
    } else if (streakDays == 30) {
      gems.add(Gem.create(
        type: GemType.diamond,
        rarity: GemRarity.legendary,
        sourceAction: 'Month streak milestone',
      ));
    } else if (streakDays == 100) {
      gems.add(Gem.create(
        type: GemType.opal,
        rarity: GemRarity.legendary,
        sourceAction: 'Century streak milestone',
      ));
    }

    return gems;
  }

  Gem _generateAchievementGem(String achievementType) {
    final gemTypeMap = {
      'focus': GemType.sapphire,
      'streak': GemType.emerald,
      'productivity': GemType.topaz,
      'social': GemType.amethyst,
      'milestone': GemType.diamond,
      'general': GemType.ruby,
    };

    final gemType = gemTypeMap[achievementType] ?? GemType.ruby;
    
    return Gem.create(
      type: gemType,
      rarity: GemRarity.epic,
      sourceAction: 'Achievement unlocked',
    );
  }

  Gem _generateAppLimitGem() {
    final random = math.Random();
    return Gem.create(
      type: GemType.onyx,
      rarity: _getWeightedRarity(random),
      sourceAction: 'App limit respected',
    );
  }

  Gem _generateWelcomeGem() {
    return Gem.create(
      type: GemType.ruby,
      rarity: GemRarity.common,
      sourceAction: 'Welcome to Lively!',
    );
  }

  List<Gem> _generatePerfectWeekGems() {
    return [
      Gem.create(
        type: GemType.diamond,
        rarity: GemRarity.legendary,
        sourceAction: 'Perfect week completed',
      ),
      Gem.create(
        type: GemType.opal,
        rarity: GemRarity.epic,
        sourceAction: 'Perfect week bonus',
      ),
    ];
  }

  GemType _getRandomGemType(math.Random random) {
    final types = GemType.values;
    return types[random.nextInt(types.length)];
  }

  GemRarity _calculateFocusRarity(int duration, math.Random random) {
    if (duration >= 90) {
      return random.nextDouble() < 0.3 ? GemRarity.legendary : GemRarity.epic;
    } else if (duration >= 60) {
      return random.nextDouble() < 0.4 ? GemRarity.epic : GemRarity.rare;
    } else if (duration >= 30) {
      return random.nextDouble() < 0.6 ? GemRarity.rare : GemRarity.common;
    } else {
      return GemRarity.common;
    }
  }

  GemRarity _calculateStreakRarity(int streakDays) {
    if (streakDays >= 30) {
      return GemRarity.legendary;
    } else if (streakDays >= 14) {
      return GemRarity.epic;
    } else if (streakDays >= 7) {
      return GemRarity.rare;
    } else {
      return GemRarity.common;
    }
  }

  GemRarity _getWeightedRarity(math.Random random, {bool rareBias = false}) {
    final roll = random.nextDouble();
    
    if (rareBias) {
      // Increased chance for rare+ gems
      if (roll < 0.05) return GemRarity.legendary;
      if (roll < 0.20) return GemRarity.epic;
      if (roll < 0.50) return GemRarity.rare;
      return GemRarity.common;
    } else {
      // Normal distribution
      if (roll < 0.02) return GemRarity.legendary;
      if (roll < 0.10) return GemRarity.epic;
      if (roll < 0.25) return GemRarity.rare;
      return GemRarity.common;
    }
  }

  /// Check if user should earn daily login gems
  Future<List<Gem>> checkDailyLoginReward() async {
    final stats = await loadStats();
    final lastEarnDate = stats['lastEarnDate'] as DateTime?;
    final now = DateTime.now();
    
    if (lastEarnDate == null || 
        !_isSameDay(lastEarnDate, now)) {
      
      // Update last earn date
      await saveStats(lastEarnDate: now);
      
      // Check if consecutive day
      int currentStreak = stats['dailyStreak'] as int;
      if (lastEarnDate != null && 
          _isConsecutiveDay(lastEarnDate, now)) {
        currentStreak++;
      } else {
        currentStreak = 1;
      }
      
      await saveStats(dailyStreak: currentStreak);
      
      // Generate daily login gems
      final random = math.Random();
      final gems = <Gem>[];
      
      // Base daily gem
      gems.add(Gem.create(
        type: _getRandomGemType(random),
        rarity: _getWeightedRarity(random),
        sourceAction: 'Daily login reward',
      ));
      
      // Streak bonus
      if (currentStreak >= 7) {
        gems.addAll(_generateStreakGems(currentStreak));
      }
      
      // Save gems
      if (gems.isNotEmpty) {
        final existingGems = await loadGems();
        final allGems = [...existingGems, ...gems];
        await saveGems(allGems);
      }
      
      return gems;
    }
    
    return [];
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }

  bool _isConsecutiveDay(DateTime yesterday, DateTime today) {
    final difference = today.difference(yesterday).inDays;
    return difference == 1;
  }

  /// Get gem earning statistics
  Future<Map<String, dynamic>> getGemStats() async {
    final gems = await loadGems();
    final stats = await loadStats();
    
    final gemsToday = gems.where((gem) => 
      gem.earnedAt != null && 
      _isSameDay(gem.earnedAt!, DateTime.now())
    ).length;
    
    final gemsThisWeek = gems.where((gem) {
      if (gem.earnedAt == null) return false;
      final weekAgo = DateTime.now().subtract(const Duration(days: 7));
      return gem.earnedAt!.isAfter(weekAgo);
    }).length;
    
    final collection = GemCollection.fromGems(gems);
    
    return {
      'totalGems': gems.length,
      'totalValue': collection.totalValue,
      'gemsToday': gemsToday,
      'gemsThisWeek': gemsThisWeek,
      'dailyStreak': stats['dailyStreak'],
      'collection': collection,
      'rareGems': collection.getCountByRarity(GemRarity.rare) +
                  collection.getCountByRarity(GemRarity.epic) +
                  collection.getCountByRarity(GemRarity.legendary),
    };
  }
} 