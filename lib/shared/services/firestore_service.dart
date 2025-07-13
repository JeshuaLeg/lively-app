import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../models/focus_session_model.dart';
import '../models/app_usage_model.dart';
import '../models/achievement_model.dart';
import '../../core/constants/app_constants.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // User Operations
  Future<UserModel?> getUser(String userId) async {
    try {
      final doc = await _firestore.collection(AppConstants.usersCollection).doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting user: $e');
      }
      rethrow;
    }
  }

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection(AppConstants.usersCollection).doc(user.id).set(user.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Error creating user: $e');
      }
      rethrow;
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection(AppConstants.usersCollection).doc(user.id).update(user.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user: $e');
      }
      rethrow;
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection(AppConstants.usersCollection).doc(userId).delete();
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting user: $e');
      }
      rethrow;
    }
  }

  Stream<UserModel?> getUserStream(String userId) {
    return _firestore
        .collection(AppConstants.usersCollection)
        .doc(userId)
        .snapshots()
        .map((doc) => doc.exists ? UserModel.fromJson(doc.data()!) : null);
  }

  // Focus Session Operations
  Future<void> createFocusSession(FocusSessionModel session) async {
    try {
      await _firestore.collection(AppConstants.focusSessionsCollection).doc(session.id).set(session.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Error creating focus session: $e');
      }
      rethrow;
    }
  }

  Future<void> updateFocusSession(FocusSessionModel session) async {
    try {
      await _firestore.collection(AppConstants.focusSessionsCollection).doc(session.id).update(session.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Error updating focus session: $e');
      }
      rethrow;
    }
  }

  Future<FocusSessionModel?> getFocusSession(String sessionId) async {
    try {
      final doc = await _firestore.collection(AppConstants.focusSessionsCollection).doc(sessionId).get();
      if (doc.exists) {
        return FocusSessionModel.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting focus session: $e');
      }
      rethrow;
    }
  }

  Future<List<FocusSessionModel>> getUserFocusSessions(String userId, {int limit = 50}) async {
    try {
      final query = await _firestore
          .collection(AppConstants.focusSessionsCollection)
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .limit(limit)
          .get();

      return query.docs
          .map((doc) => FocusSessionModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error getting user focus sessions: $e');
      }
      rethrow;
    }
  }

  Future<List<FocusSessionModel>> getActiveFocusSessions(String userId) async {
    try {
      final query = await _firestore
          .collection(AppConstants.focusSessionsCollection)
          .where('userId', isEqualTo: userId)
          .where('status', isEqualTo: SessionStatus.active.name)
          .get();

      return query.docs
          .map((doc) => FocusSessionModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error getting active focus sessions: $e');
      }
      rethrow;
    }
  }

  Stream<List<FocusSessionModel>> getUserFocusSessionsStream(String userId) {
    return _firestore
        .collection(AppConstants.focusSessionsCollection)
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => FocusSessionModel.fromJson(doc.data()))
            .toList());
  }

  // App Usage Operations
  Future<void> createAppUsage(AppUsageModel usage) async {
    try {
      await _firestore.collection(AppConstants.appUsageCollection).doc(usage.id).set(usage.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Error creating app usage: $e');
      }
      rethrow;
    }
  }

  Future<void> updateAppUsage(AppUsageModel usage) async {
    try {
      await _firestore.collection(AppConstants.appUsageCollection).doc(usage.id).update(usage.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Error updating app usage: $e');
      }
      rethrow;
    }
  }

  Future<List<AppUsageModel>> getUserAppUsage(String userId, DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final query = await _firestore
          .collection(AppConstants.appUsageCollection)
          .where('userId', isEqualTo: userId)
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
          .where('date', isLessThan: Timestamp.fromDate(endOfDay))
          .get();

      return query.docs
          .map((doc) => AppUsageModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error getting user app usage: $e');
      }
      rethrow;
    }
  }

  Future<DailyUsageStats?> getDailyUsageStats(String userId, DateTime date) async {
    try {
      final dateStr = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      final doc = await _firestore
          .collection('daily_usage_stats')
          .doc('${userId}_$dateStr')
          .get();

      if (doc.exists) {
        return DailyUsageStats.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting daily usage stats: $e');
      }
      rethrow;
    }
  }

  Future<void> saveDailyUsageStats(DailyUsageStats stats) async {
    try {
      final dateStr = '${stats.date.year}-${stats.date.month.toString().padLeft(2, '0')}-${stats.date.day.toString().padLeft(2, '0')}';
      await _firestore
          .collection('daily_usage_stats')
          .doc('${stats.userId}_$dateStr')
          .set(stats.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Error saving daily usage stats: $e');
      }
      rethrow;
    }
  }

  // Achievement Operations
  Future<List<UserAchievementModel>> getUserAchievements(String userId) async {
    try {
      final query = await _firestore
          .collection(AppConstants.achievementsCollection)
          .where('userId', isEqualTo: userId)
          .get();

      return query.docs
          .map((doc) => UserAchievementModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error getting user achievements: $e');
      }
      rethrow;
    }
  }

  Future<void> updateUserAchievement(UserAchievementModel achievement) async {
    try {
      await _firestore
          .collection(AppConstants.achievementsCollection)
          .doc(achievement.id)
          .set(achievement.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user achievement: $e');
      }
      rethrow;
    }
  }

  Future<void> unlockAchievement(String userId, String achievementId) async {
    try {
      await _firestore
          .collection(AppConstants.achievementsCollection)
          .where('userId', isEqualTo: userId)
          .where('achievementId', isEqualTo: achievementId)
          .get()
          .then((query) {
        if (query.docs.isNotEmpty) {
          query.docs.first.reference.update({
            'isUnlocked': true,
            'unlockedAt': FieldValue.serverTimestamp(),
          });
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error unlocking achievement: $e');
      }
      rethrow;
    }
  }

  // Blocked Apps Operations
  Future<void> updateBlockedApps(String userId, List<String> blockedApps) async {
    try {
      await _firestore
          .collection(AppConstants.usersCollection)
          .doc(userId)
          .update({'blockedApps': blockedApps});
    } catch (e) {
      if (kDebugMode) {
        print('Error updating blocked apps: $e');
      }
      rethrow;
    }
  }

  Future<void> addBlockedApp(String userId, String appName) async {
    try {
      await _firestore
          .collection(AppConstants.usersCollection)
          .doc(userId)
          .update({
        'blockedApps': FieldValue.arrayUnion([appName])
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error adding blocked app: $e');
      }
      rethrow;
    }
  }

  Future<void> removeBlockedApp(String userId, String appName) async {
    try {
      await _firestore
          .collection(AppConstants.usersCollection)
          .doc(userId)
          .update({
        'blockedApps': FieldValue.arrayRemove([appName])
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error removing blocked app: $e');
      }
      rethrow;
    }
  }

  // Statistics Operations
  Future<Map<String, dynamic>> getUserStats(String userId) async {
    try {
      final user = await getUser(userId);
      if (user == null) return {};

      final sessions = await getUserFocusSessions(userId);
      final completedSessions = sessions.where((s) => s.isCompleted).toList();
      
      final today = DateTime.now();
      final todayStats = await getDailyUsageStats(userId, today);
      
      final thisWeek = today.subtract(Duration(days: today.weekday - 1));
      final weeklyStats = <DailyUsageStats>[];
      
      for (int i = 0; i < 7; i++) {
        final date = thisWeek.add(Duration(days: i));
        final stats = await getDailyUsageStats(userId, date);
        if (stats != null) {
          weeklyStats.add(stats);
        }
      }

      return {
        'user': user,
        'totalSessions': sessions.length,
        'completedSessions': completedSessions.length,
        'totalFocusTime': user.totalFocusTime,
        'currentStreak': user.currentStreak,
        'longestStreak': user.longestStreak,
        'level': user.level,
        'todayStats': todayStats,
        'weeklyStats': weeklyStats,
        'averageFocusScore': completedSessions.isEmpty 
            ? 0.0 
            : completedSessions.map((s) => s.focusScore).reduce((a, b) => a + b) / completedSessions.length,
      };
    } catch (e) {
      if (kDebugMode) {
        print('Error getting user stats: $e');
      }
      rethrow;
    }
  }

  // Social Features
  Future<void> addFriend(String userId, String friendId) async {
    try {
      await _firestore
          .collection(AppConstants.usersCollection)
          .doc(userId)
          .update({
        'friends': FieldValue.arrayUnion([friendId])
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error adding friend: $e');
      }
      rethrow;
    }
  }

  Future<void> removeFriend(String userId, String friendId) async {
    try {
      await _firestore
          .collection(AppConstants.usersCollection)
          .doc(userId)
          .update({
        'friends': FieldValue.arrayRemove([friendId])
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error removing friend: $e');
      }
      rethrow;
    }
  }

  Future<List<UserModel>> getFriends(String userId) async {
    try {
      final user = await getUser(userId);
      if (user == null || user.friends.isEmpty) return [];

      final query = await _firestore
          .collection(AppConstants.usersCollection)
          .where(FieldPath.documentId, whereIn: user.friends)
          .get();

      return query.docs
          .map((doc) => UserModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error getting friends: $e');
      }
      rethrow;
    }
  }

  Future<List<UserModel>> searchUsers(String query, {int limit = 10}) async {
    try {
      final results = await _firestore
          .collection(AppConstants.usersCollection)
          .where('displayName', isGreaterThanOrEqualTo: query)
          .where('displayName', isLessThan: query + '\uf8ff')
          .limit(limit)
          .get();

      return results.docs
          .map((doc) => UserModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error searching users: $e');
      }
      rethrow;
    }
  }

  // Batch Operations
  Future<void> batchUpdateUserStats(String userId, {
    int? totalFocusTime,
    int? totalSessions,
    int? currentStreak,
    int? longestStreak,
  }) async {
    try {
      final batch = _firestore.batch();
      final userRef = _firestore.collection(AppConstants.usersCollection).doc(userId);

      final updateData = <String, dynamic>{
        'updatedAt': FieldValue.serverTimestamp(),
      };

      if (totalFocusTime != null) updateData['totalFocusTime'] = totalFocusTime;
      if (totalSessions != null) updateData['totalSessions'] = totalSessions;
      if (currentStreak != null) updateData['currentStreak'] = currentStreak;
      if (longestStreak != null) updateData['longestStreak'] = longestStreak;

      batch.update(userRef, updateData);
      await batch.commit();
    } catch (e) {
      if (kDebugMode) {
        print('Error batch updating user stats: $e');
      }
      rethrow;
    }
  }

  // Cleanup Operations
  Future<void> deleteOldSessions(String userId, Duration olderThan) async {
    try {
      final cutoffDate = DateTime.now().subtract(olderThan);
      final query = await _firestore
          .collection(AppConstants.focusSessionsCollection)
          .where('userId', isEqualTo: userId)
          .where('createdAt', isLessThan: Timestamp.fromDate(cutoffDate))
          .get();

      final batch = _firestore.batch();
      for (final doc in query.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting old sessions: $e');
      }
      rethrow;
    }
  }

  Future<void> deleteOldAppUsage(String userId, Duration olderThan) async {
    try {
      final cutoffDate = DateTime.now().subtract(olderThan);
      final query = await _firestore
          .collection(AppConstants.appUsageCollection)
          .where('userId', isEqualTo: userId)
          .where('date', isLessThan: Timestamp.fromDate(cutoffDate))
          .get();

      final batch = _firestore.batch();
      for (final doc in query.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting old app usage: $e');
      }
      rethrow;
    }
  }
}