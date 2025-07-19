import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../models/user_model.dart';

// Auth Service Provider
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

// Firestore Service Provider
final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

// Current Firebase User Stream
final authStateProvider = StreamProvider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
});

// Current User Model Provider
final currentUserProvider = StreamProvider<UserModel?>((ref) {
  final authState = ref.watch(authStateProvider);
  
  return authState.when(
    data: (user) {
      if (user == null) {
        return Stream.value(null);
      }
      
      final firestoreService = ref.watch(firestoreServiceProvider);
      return firestoreService.getUserStream(user.uid);
    },
    loading: () => Stream.value(null),
    error: (error, stackTrace) => Stream.value(null),
  );
});

// Auth State Notifier
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  AuthNotifier(this._authService, this._firestoreService) : super(const AsyncValue.loading()) {
    _authService.authStateChanges.listen((user) {
      state = AsyncValue.data(user);
    });
  }

  final AuthService _authService;
  final FirestoreService _firestoreService;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final userCredential = await _authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Create user document in Firestore
      if (userCredential?.user != null) {
        final user = userCredential!.user!;
        final userModel = UserModel(
          id: user.uid,
          email: user.email ?? email,
          displayName: user.displayName,
          photoUrl: user.photoURL,
          isEmailVerified: user.emailVerified,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        
        await _firestoreService.createUser(userModel);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      await _authService.signInWithGoogle();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Future<void> signInWithApple() async {
  //   state = const AsyncValue.loading();
  //   try {
  //     await _authService.signInWithApple();
  //   } catch (e) {
  //     state = AsyncValue.error(e, StackTrace.current);
  //   }
  // }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _authService.signOut();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _authService.sendPasswordResetEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _authService.sendEmailVerification();
    } catch (e) {
      rethrow;
    }
  }
}

// Auth Notifier Provider
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final authService = ref.watch(authServiceProvider);
  final firestoreService = ref.watch(firestoreServiceProvider);
  return AuthNotifier(authService, firestoreService);
});

// User Management Notifier
class UserNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  UserNotifier(this._firestoreService) : super(const AsyncValue.loading());

  final FirestoreService _firestoreService;

  Future<void> createUser(UserModel user) async {
    state = const AsyncValue.loading();
    try {
      await _firestoreService.createUser(user);
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestoreService.updateUser(user);
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateUserSettings({
    String? themeMode,
    bool? notificationsEnabled,
    bool? soundEnabled,
    bool? vibrationEnabled,
    int? dailyGoal,
    int? weeklyGoal,
    String? defaultDifficulty,
    int? defaultSessionDuration,
  }) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final updatedUser = currentUser.copyWith(
      themeMode: themeMode ?? currentUser.themeMode,
      notificationsEnabled: notificationsEnabled ?? currentUser.notificationsEnabled,
      soundEnabled: soundEnabled ?? currentUser.soundEnabled,
      vibrationEnabled: vibrationEnabled ?? currentUser.vibrationEnabled,
      dailyGoal: dailyGoal ?? currentUser.dailyGoal,
      weeklyGoal: weeklyGoal ?? currentUser.weeklyGoal,
      defaultDifficulty: defaultDifficulty ?? currentUser.defaultDifficulty,
      defaultSessionDuration: defaultSessionDuration ?? currentUser.defaultSessionDuration,
      updatedAt: DateTime.now(),
    );

    await updateUser(updatedUser);
  }

  Future<void> addBlockedApp(String appName) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final updatedApps = List<String>.from(currentUser.blockedApps)..add(appName);
    final updatedUser = currentUser.copyWith(
      blockedApps: updatedApps,
      updatedAt: DateTime.now(),
    );

    await updateUser(updatedUser);
  }

  Future<void> removeBlockedApp(String appName) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final updatedApps = List<String>.from(currentUser.blockedApps)..remove(appName);
    final updatedUser = currentUser.copyWith(
      blockedApps: updatedApps,
      updatedAt: DateTime.now(),
    );

    await updateUser(updatedUser);
  }

  Future<void> updateFocusStats({
    int? totalFocusTime,
    int? totalSessions,
    int? currentStreak,
    int? longestStreak,
  }) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final updatedUser = currentUser.copyWith(
      totalFocusTime: totalFocusTime ?? currentUser.totalFocusTime,
      totalSessions: totalSessions ?? currentUser.totalSessions,
      currentStreak: currentStreak ?? currentUser.currentStreak,
      longestStreak: longestStreak ?? currentUser.longestStreak,
      updatedAt: DateTime.now(),
    );

    await updateUser(updatedUser);
  }

  Future<void> addFriend(String friendId) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final updatedFriends = List<String>.from(currentUser.friends)..add(friendId);
    final updatedUser = currentUser.copyWith(
      friends: updatedFriends,
      updatedAt: DateTime.now(),
    );

    await updateUser(updatedUser);
  }

  Future<void> removeFriend(String friendId) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final updatedFriends = List<String>.from(currentUser.friends)..remove(friendId);
    final updatedUser = currentUser.copyWith(
      friends: updatedFriends,
      updatedAt: DateTime.now(),
    );

    await updateUser(updatedUser);
  }

  Future<void> unlockAchievement(String achievementId) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final updatedAchievements = List<String>.from(currentUser.achievements)..add(achievementId);
    final updatedUser = currentUser.copyWith(
      achievements: updatedAchievements,
      updatedAt: DateTime.now(),
    );

    await updateUser(updatedUser);
  }

  Future<void> completeOnboarding() async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final updatedUser = currentUser.copyWith(
      isOnboardingCompleted: true,
      updatedAt: DateTime.now(),
    );

    await updateUser(updatedUser);
  }

  Future<void> upgradeToProUser() async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final updatedUser = currentUser.copyWith(
      isPremium: true,
      premiumExpiryDate: DateTime.now().add(const Duration(days: 365)), // 1 year
      updatedAt: DateTime.now(),
    );

    await updateUser(updatedUser);
  }
}

// User Notifier Provider
final userNotifierProvider = StateNotifierProvider<UserNotifier, AsyncValue<UserModel?>>((ref) {
  final firestoreService = ref.watch(firestoreServiceProvider);
  return UserNotifier(firestoreService);
});

// Helper Providers
final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (user) => user != null,
    loading: () => false,
    error: (error, stackTrace) => false,
  );
});

final isEmailVerifiedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (user) => user?.emailVerified ?? false,
    loading: () => false,
    error: (error, stackTrace) => false,
  );
});

final currentUserIdProvider = Provider<String?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (user) => user?.uid,
    loading: () => null,
    error: (error, stackTrace) => null,
  );
});

final userStatsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return {};

  final firestoreService = ref.watch(firestoreServiceProvider);
  return await firestoreService.getUserStats(userId);
});

final friendsProvider = FutureProvider<List<UserModel>>((ref) async {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return [];

  final firestoreService = ref.watch(firestoreServiceProvider);
  return await firestoreService.getFriends(userId);
});

// Search Users Provider
final searchUsersProvider = FutureProvider.family<List<UserModel>, String>((ref, query) async {
  if (query.isEmpty) return [];
  
  final firestoreService = ref.watch(firestoreServiceProvider);
  return await firestoreService.searchUsers(query);
});