class AppConstants {
  // App Information
  static const String appName = 'Lively';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Focus and Screen Time Management';
  
  // Firebase Collections
  static const String usersCollection = 'users';
  static const String focusSessionsCollection = 'focus_sessions';
  static const String appUsageCollection = 'app_usage';
  static const String blockedAppsCollection = 'blocked_apps';
  static const String userSettingsCollection = 'user_settings';
  static const String achievementsCollection = 'achievements';
  static const String streaksCollection = 'streaks';
  
  // Routes
  static const String splashRoute = '/splash';
  static const String onboardingRoute = '/onboarding';
  static const String authRoute = '/auth';
  static const String homeRoute = '/home';
  static const String blocksRoute = '/blocks';  // New route for focus sessions and app blocking
  static const String focusRoute = '/focus';  // Keep for backward compatibility
  static const String statisticsRoute = '/statistics';
  static const String settingsRoute = '/settings';
  static const String profileRoute = '/profile';
  static const String createSessionRoute = '/create-session';
  static const String sessionTimerRoute = '/session-timer';
  static const String blockedAppsRoute = '/blocked-apps';
  static const String achievementsRoute = '/achievements';
  
  // Shared Preferences Keys
  static const String themeKey = 'theme_mode';
  static const String onboardingCompletedKey = 'onboarding_completed';
  static const String firstLaunchKey = 'first_launch';
  static const String notificationsEnabledKey = 'notifications_enabled';
  static const String dailyGoalKey = 'daily_goal';
  static const String weeklyGoalKey = 'weekly_goal';
  
  // Focus Session Types
  static const String timerSession = 'timer';
  static const String scheduledSession = 'scheduled';
  static const String deepFocusSession = 'deep_focus';
  
  // Focus Difficulty Levels
  static const String normalDifficulty = 'normal';
  static const String timeoutDifficulty = 'timeout';
  static const String deepFocusDifficulty = 'deep_focus';
  
  // Achievement Types
  static const String streakAchievement = 'streak';
  static const String timeAchievement = 'time';
  static const String sessionAchievement = 'session';
  static const String specialAchievement = 'special';
  
  // Achievement Rarities (matching Opal's gem system)
  static const String commonRarity = 'common';
  static const String rareRarity = 'rare';
  static const String epicRarity = 'epic';
  static const String legendaryRarity = 'legendary';
  static const String mythicalRarity = 'mythical';
  
  // Notification Types
  static const String sessionStartNotification = 'session_start';
  static const String sessionEndNotification = 'session_end';
  static const String breakReminderNotification = 'break_reminder';
  static const String dailyGoalNotification = 'daily_goal';
  static const String achievementUnlockedNotification = 'achievement_unlocked';
  
  // App Usage Categories
  static const String productiveCategory = 'productive';
  static const String distractingCategory = 'distracting';
  static const String neutralCategory = 'neutral';
  static const String blockedCategory = 'blocked';
  
  // Time Periods
  static const String todayPeriod = 'today';
  static const String weekPeriod = 'week';
  static const String monthPeriod = 'month';
  static const String yearPeriod = 'year';
  static const String allTimePeriod = 'all_time';
  
  // Focus Session States
  static const String activeFocusState = 'active';
  static const String pausedFocusState = 'paused';
  static const String completedFocusState = 'completed';
  static const String cancelledFocusState = 'cancelled';
  
  // Default Values
  static const int defaultFocusMinutes = 25;
  static const int defaultBreakMinutes = 5;
  static const int defaultLongBreakMinutes = 15;
  static const int defaultDailyGoalMinutes = 120;
  static const int defaultWeeklyGoalMinutes = 840;
  
  // Gem/Crystal System (matching Opal's visual style)
  static const String opalGem = 'opal';
  static const String sapphireGem = 'sapphire';
  static const String emeraldGem = 'emerald';
  static const String rubyGem = 'ruby';
  static const String diamondGem = 'diamond';
  static const String amethystGem = 'amethyst';
  static const String topazGem = 'topaz';
  static const String quartzGem = 'quartz';
  static const String peridotGem = 'peridot';
  static const String garnetGem = 'garnet';
  
  // Focus Timer Backgrounds (matching Opal's galaxy themes)
  static const String galaxyBackground = 'galaxy';
  static const String nebulaBackground = 'nebula';
  static const String starsBackground = 'stars';
  static const String cosmicBackground = 'cosmic';
  static const String auroraBackground = 'aurora';
  
  // Social Features
  static const String friendsFeature = 'friends';
  static const String leaderboardFeature = 'leaderboard';
  static const String sharingFeature = 'sharing';
  static const String challengesFeature = 'challenges';
  
  // Error Messages
  static const String networkErrorMessage = 'Please check your internet connection';
  static const String genericErrorMessage = 'Something went wrong. Please try again';
  static const String authErrorMessage = 'Authentication failed. Please try again';
  static const String permissionErrorMessage = 'Permission required to continue';
  
  // Success Messages
  static const String sessionCompletedMessage = 'Focus session completed!';
  static const String achievementUnlockedMessage = 'Achievement unlocked!';
  static const String goalReachedMessage = 'Goal reached!';
  static const String streakMaintainedMessage = 'Streak maintained!';
  
  // API Endpoints (if needed for future integrations)
  static const String baseApiUrl = 'https://api.lively.app';
  static const String authEndpoint = '/auth';
  static const String userEndpoint = '/user';
  static const String sessionsEndpoint = '/sessions';
  static const String achievementsEndpoint = '/achievements';
  static const String leaderboardEndpoint = '/leaderboard';
  
  // Feature Flags
  static const String socialFeaturesEnabled = 'social_features_enabled';
  static const String analyticsEnabled = 'analytics_enabled';
  static const String notificationsEnabled = 'notifications_enabled';
  static const String crashReportingEnabled = 'crash_reporting_enabled';
  static const String betaFeaturesEnabled = 'beta_features_enabled';
}