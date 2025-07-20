import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/gem_model.dart';
import '../services/gem_service.dart';

// Service provider
final gemServiceProvider = Provider<GemService>((ref) => GemService());

// Gem collection state
class GemState {
  final GemCollection collection;
  final bool isLoading;
  final String? error;
  final Map<String, dynamic> stats;

  const GemState({
    required this.collection,
    required this.isLoading,
    this.error,
    required this.stats,
  });

  GemState copyWith({
    GemCollection? collection,
    bool? isLoading,
    String? error,
    Map<String, dynamic>? stats,
  }) {
    return GemState(
      collection: collection ?? this.collection,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      stats: stats ?? this.stats,
    );
  }
}

// Gem state notifier
class GemNotifier extends StateNotifier<GemState> {
  final GemService _gemService;

  GemNotifier(this._gemService) : super(GemState(
    collection: GemCollection.empty(),
    isLoading: true,
    stats: {},
  )) {
    _loadGems();
  }

  Future<void> _loadGems() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      
      final gems = await _gemService.loadGems();
      final stats = await _gemService.getGemStats();
      final collection = GemCollection.fromGems(gems);
      
      state = state.copyWith(
        collection: collection,
        stats: stats,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load gems: $e',
      );
    }
  }

  Future<List<Gem>> earnGems(String action, {Map<String, dynamic>? metadata}) async {
    try {
      final earnedGems = await _gemService.earnGemsForAction(action, metadata: metadata);
      
      if (earnedGems.isNotEmpty) {
        // Refresh state
        await _loadGems();
      }
      
      return earnedGems;
    } catch (e) {
      state = state.copyWith(error: 'Failed to earn gems: $e');
      return [];
    }
  }

  Future<List<Gem>> checkDailyReward() async {
    try {
      final dailyGems = await _gemService.checkDailyLoginReward();
      
      if (dailyGems.isNotEmpty) {
        // Refresh state
        await _loadGems();
      }
      
      return dailyGems;
    } catch (e) {
      state = state.copyWith(error: 'Failed to check daily reward: $e');
      return [];
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> refresh() async {
    await _loadGems();
  }
}

// Provider
final gemProvider = StateNotifierProvider<GemNotifier, GemState>((ref) {
  final gemService = ref.watch(gemServiceProvider);
  return GemNotifier(gemService);
});

// Convenience providers for specific data
final gemCollectionProvider = Provider<GemCollection>((ref) {
  return ref.watch(gemProvider).collection;
});

final gemStatsProvider = Provider<Map<String, dynamic>>((ref) {
  return ref.watch(gemProvider).stats;
});

final isLoadingGemsProvider = Provider<bool>((ref) {
  return ref.watch(gemProvider).isLoading;
});

final gemErrorProvider = Provider<String?>((ref) {
  return ref.watch(gemProvider).error;
});

// Specific gem counts providers
final totalGemsProvider = Provider<int>((ref) {
  return ref.watch(gemCollectionProvider).gems.length;
});

final totalGemValueProvider = Provider<int>((ref) {
  return ref.watch(gemCollectionProvider).totalValue;
});

final dailyStreakProvider = Provider<int>((ref) {
  final stats = ref.watch(gemStatsProvider);
  return stats['dailyStreak'] ?? 0;
});

final gemsEarnedTodayProvider = Provider<int>((ref) {
  final stats = ref.watch(gemStatsProvider);
  return stats['gemsToday'] ?? 0;
});

final rareGemsCountProvider = Provider<int>((ref) {
  final stats = ref.watch(gemStatsProvider);
  return stats['rareGems'] ?? 0;
});

// Gem type specific providers
final gemsByTypeProvider = Provider.family<List<Gem>, GemType>((ref, type) {
  return ref.watch(gemCollectionProvider).getGemsByType(type);
});

final gemsByRarityProvider = Provider.family<List<Gem>, GemRarity>((ref, rarity) {
  return ref.watch(gemCollectionProvider).getGemsByRarity(rarity);
});

final gemCountByTypeProvider = Provider.family<int, GemType>((ref, type) {
  return ref.watch(gemCollectionProvider).getCountByType(type);
});

final gemCountByRarityProvider = Provider.family<int, GemRarity>((ref, rarity) {
  return ref.watch(gemCollectionProvider).getCountByRarity(rarity);
});

// Recent gems provider (last 24 hours)
final recentGemsProvider = Provider<List<Gem>>((ref) {
  final collection = ref.watch(gemCollectionProvider);
  final now = DateTime.now();
  final yesterday = now.subtract(const Duration(hours: 24));
  
  return collection.gems.where((gem) {
    return gem.earnedAt != null && gem.earnedAt!.isAfter(yesterday);
  }).toList()..sort((a, b) => b.earnedAt!.compareTo(a.earnedAt!));
});

// Achievements based on gem collection
final gemAchievementsProvider = Provider<List<String>>((ref) {
  final collection = ref.watch(gemCollectionProvider);
  final stats = ref.watch(gemStatsProvider);
  final achievements = <String>[];
  
  // Collection milestones
  final totalGems = collection.gems.length;
  if (totalGems >= 100) achievements.add('Gem Collector');
  if (totalGems >= 500) achievements.add('Gem Master');
  if (totalGems >= 1000) achievements.add('Gem Legend');
  
  // Rarity achievements
  final legendary = collection.getCountByRarity(GemRarity.legendary);
  if (legendary >= 1) achievements.add('First Legend');
  if (legendary >= 10) achievements.add('Legendary Collector');
  
  // Streak achievements
  final streak = stats['dailyStreak'] ?? 0;
  if (streak >= 7) achievements.add('Week Warrior');
  if (streak >= 30) achievements.add('Month Master');
  if (streak >= 100) achievements.add('Century Champion');
  
  // Value achievements
  final totalValue = collection.totalValue;
  if (totalValue >= 1000) achievements.add('Valuable Collection');
  if (totalValue >= 10000) achievements.add('Treasure Hunter');
  
  return achievements;
});

// Helper function to award gems - can be called from anywhere in the app
Future<void> awardGems(WidgetRef ref, String action, {Map<String, dynamic>? metadata}) async {
  final notifier = ref.read(gemProvider.notifier);
  await notifier.earnGems(action, metadata: metadata);
} 