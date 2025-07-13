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
  static const String focusRoute = '/focus';
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
  
  // App Categories
  static const List<String> socialMediaApps = [
    'Instagram',
    'Facebook',
    'Twitter',
    'TikTok',
    'Snapchat',
    'LinkedIn',
    'Reddit',
    'Discord',
    'WhatsApp',
    'Telegram',
  ];
  
  static const List<String> entertainmentApps = [
    'YouTube',
    'Netflix',
    'Disney+',
    'Hulu',
    'Amazon Prime Video',
    'Spotify',
    'Apple Music',
    'Twitch',
    'Tubi',
    'Crunchyroll',
  ];
  
  static const List<String> gamesApps = [
    'Call of Duty',
    'Fortnite',
    'PUBG',
    'Candy Crush',
    'Clash of Clans',
    'Among Us',
    'Minecraft',
    'Roblox',
    'Pokemon GO',
    'Clash Royale',
  ];
  
  static const List<String> newsApps = [
    'BBC News',
    'CNN',
    'The Guardian',
    'The New York Times',
    'Reuters',
    'Associated Press',
    'Fox News',
    'NPR',
    'Wall Street Journal',
    'Washington Post',
  ];
  
  static const List<String> shoppingApps = [
    'Amazon',
    'eBay',
    'Walmart',
    'Target',
    'Best Buy',
    'Etsy',
    'Alibaba',
    'Wish',
    'Shopify',
    'Mercado Libre',
  ];
  
  // Focus Quotes
  static const List<String> focusQuotes = [
    "The successful warrior is the average man with laser-like focus.",
    "Focus is not about saying yes, it's about saying no.",
    "Where attention goes, energy flows.",
    "Concentration is the secret of strength.",
    "The art of being wise is knowing what to overlook.",
    "Focus on being productive instead of being busy.",
    "Your focus determines your reality.",
    "The ability to focus and to concentrate is among the most important abilities.",
    "Concentrate all your thoughts upon the work at hand.",
    "The successful person has the habit of doing the things failures don't like to do.",
  ];
  
  // Notification Messages
  static const List<String> sessionStartMessages = [
    "Focus session started! 🎯",
    "Time to focus! Let's do this! 💪",
    "Focus mode activated! 🚀",
    "You've got this! Stay focused! ✨",
    "Focus time! Make it count! 🔥",
  ];
  
  static const List<String> sessionEndMessages = [
    "Great job! Session completed! 🎉",
    "Amazing focus! Well done! 👏",
    "Focus session complete! You did it! ✅",
    "Excellent work! Keep it up! 🌟",
    "Another successful session! 🎯",
  ];
  
  // Achievement Types
  static const String dailyStreak = 'daily_streak';
  static const String weeklyStreak = 'weekly_streak';
  static const String monthlyStreak = 'monthly_streak';
  static const String totalFocusTime = 'total_focus_time';
  static const String sessionsCompleted = 'sessions_completed';
  static const String deepFocusAchievement = 'deep_focus_achievement';
  static const String earlyAdopter = 'early_adopter';
  static const String inviteFreinds = 'invite_friends';
  
  // Time Constants
  static const int minSessionDuration = 5; // minutes
  static const int maxSessionDuration = 480; // 8 hours
  static const int defaultSessionDuration = 25; // minutes
  static const int shortBreakDuration = 5; // minutes
  static const int longBreakDuration = 15; // minutes
  static const int defaultDailyGoal = 120; // minutes
  static const int defaultWeeklyGoal = 840; // minutes (2 hours * 7 days)
  
  // Colors for categories
  static const Map<String, int> categoryColors = {
    'Social Media': 0xFF6B73FF,
    'Entertainment': 0xFF9B59B6,
    'Games': 0xFFFF6B9D,
    'News': 0xFF2ECC71,
    'Shopping': 0xFFF39C12,
    'Productivity': 0xFF3498DB,
    'Education': 0xFFE74C3C,
    'Health': 0xFF1ABC9C,
    'Finance': 0xFFE67E22,
    'Travel': 0xFF9C88FF,
  };
  
  // API Configuration
  static const String baseUrl = 'https://api.lively.app';
  static const int requestTimeout = 30000; // 30 seconds
  static const int maxRetries = 3;
  
  // Analytics Events
  static const String sessionStartedEvent = 'session_started';
  static const String sessionCompletedEvent = 'session_completed';
  static const String sessionCancelledEvent = 'session_cancelled';
  static const String appBlockedEvent = 'app_blocked';
  static const String achievementUnlockedEvent = 'achievement_unlocked';
  static const String userRegisteredEvent = 'user_registered';
  static const String userLoginEvent = 'user_login';
  static const String settingsChangedEvent = 'settings_changed';
  
  // Error Messages
  static const String genericError = 'Something went wrong. Please try again.';
  static const String networkError = 'Network connection error. Please check your internet connection.';
  static const String authError = 'Authentication failed. Please try again.';
  static const String permissionDeniedError = 'Permission denied. Please grant the required permissions.';
  static const String sessionActiveError = 'Another session is already active.';
  static const String noDataError = 'No data available.';
  
  // Success Messages
  static const String sessionCreatedSuccess = 'Focus session created successfully!';
  static const String sessionCompletedSuccess = 'Congratulations! Session completed successfully!';
  static const String settingsSavedSuccess = 'Settings saved successfully!';
  static const String profileUpdatedSuccess = 'Profile updated successfully!';
  static const String achievementUnlockedSuccess = 'Achievement unlocked! 🎉';
}