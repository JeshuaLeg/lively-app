import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import '../../features/auth/screens/auth_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/focus/screens/focus_screen.dart';
import '../../features/focus/screens/session_timer_screen.dart';
import '../../features/focus/screens/create_session_screen.dart';
import '../../features/statistics/screens/statistics_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/achievements_screen.dart';
import '../constants/app_constants.dart';
import '../../shared/providers/auth_provider.dart';

// Custom Page with slide transition
class SlidePage extends CustomTransitionPage {
  const SlidePage({
    required Widget child,
    required String name,
    Object? arguments,
    String? restorationId,
  }) : super(
          child: child,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
          transitionsBuilder: _slideTransition,
        );

  static Widget _slideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
      ),
      child: child,
    );
  }
}

// Custom Page with fade transition
class FadePage extends CustomTransitionPage {
  const FadePage({
    required Widget child,
    required String name,
    Object? arguments,
    String? restorationId,
  }) : super(
          child: child,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
          transitionsBuilder: _fadeTransition,
        );

  static Widget _fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

// App Router Configuration
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppConstants.splashRoute,
    redirect: (context, state) {
      final authState = ref.watch(authStateProvider);
      final isLoggedIn = ref.watch(isLoggedInProvider);
      
      // Handle authentication redirect
      return authState.when(
        data: (user) {
          // If user is on splash screen, redirect based on auth state
          if (state.uri.toString() == AppConstants.splashRoute) {
            if (user != null) {
              return AppConstants.homeRoute;
            } else {
              return AppConstants.authRoute;
            }
          }
          
          // Protect authenticated routes
          if (user == null && _protectedRoutes.contains(state.uri.toString())) {
            return AppConstants.authRoute;
          }
          
          // Redirect authenticated users away from auth screens
          if (user != null && _authRoutes.contains(state.uri.toString())) {
            return AppConstants.homeRoute;
          }
          
          return null;
        },
        loading: () => null,
        error: (error, stackTrace) => AppConstants.authRoute,
      );
    },
    routes: [
      // Splash Screen
      GoRoute(
        path: AppConstants.splashRoute,
        name: 'splash',
        pageBuilder: (context, state) => const FadePage(
          child: SplashScreen(),
          name: 'splash',
        ),
      ),
      
      // Authentication Routes
      GoRoute(
        path: AppConstants.authRoute,
        name: 'auth',
        pageBuilder: (context, state) => const SlidePage(
          child: AuthScreen(),
          name: 'auth',
        ),
      ),
      
      // Onboarding Routes
      GoRoute(
        path: AppConstants.onboardingRoute,
        name: 'onboarding',
        pageBuilder: (context, state) => const SlidePage(
          child: OnboardingScreen(),
          name: 'onboarding',
        ),
      ),
      
      // Main App Routes
      GoRoute(
        path: AppConstants.homeRoute,
        name: 'home',
        pageBuilder: (context, state) => const FadePage(
          child: HomeScreen(),
          name: 'home',
        ),
      ),
      
      GoRoute(
        path: AppConstants.focusRoute,
        name: 'focus',
        pageBuilder: (context, state) => const SlidePage(
          child: FocusScreen(),
          name: 'focus',
        ),
      ),
      
      GoRoute(
        path: AppConstants.createSessionRoute,
        name: 'create-session',
        pageBuilder: (context, state) => const SlidePage(
          child: CreateSessionScreen(),
          name: 'create-session',
        ),
      ),
      
      GoRoute(
        path: AppConstants.sessionTimerRoute,
        name: 'session-timer',
        pageBuilder: (context, state) {
          final sessionId = state.uri.queryParameters['sessionId'] ?? '';
          return SlidePage(
            child: SessionTimerScreen(sessionId: sessionId),
            name: 'session-timer',
          );
        },
      ),
      
      GoRoute(
        path: AppConstants.statisticsRoute,
        name: 'statistics',
        pageBuilder: (context, state) => const SlidePage(
          child: StatisticsScreen(),
          name: 'statistics',
        ),
      ),
      
      GoRoute(
        path: AppConstants.settingsRoute,
        name: 'settings',
        pageBuilder: (context, state) => const SlidePage(
          child: SettingsScreen(),
          name: 'settings',
        ),
      ),
      
      GoRoute(
        path: AppConstants.profileRoute,
        name: 'profile',
        pageBuilder: (context, state) => const SlidePage(
          child: ProfileScreen(),
          name: 'profile',
        ),
      ),
      
      GoRoute(
        path: AppConstants.achievementsRoute,
        name: 'achievements',
        pageBuilder: (context, state) => const SlidePage(
          child: AchievementsScreen(),
          name: 'achievements',
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      child: ErrorScreen(
        error: state.error.toString(),
        onRetry: () => context.go(AppConstants.homeRoute),
      ),
    ),
  );
});

// Helper lists for route protection
final _protectedRoutes = [
  AppConstants.homeRoute,
  AppConstants.focusRoute,
  AppConstants.createSessionRoute,
  AppConstants.sessionTimerRoute,
  AppConstants.statisticsRoute,
  AppConstants.settingsRoute,
  AppConstants.profileRoute,
  AppConstants.achievementsRoute,
];

final _authRoutes = [
  AppConstants.authRoute,
  AppConstants.onboardingRoute,
];

// Navigation Extension
extension GoRouterExtension on GoRouter {
  void pushAndClearStack(String path) {
    while (canPop()) {
      pop();
    }
    pushReplacement(path);
  }
}

// Context Extensions for Navigation
extension NavigationExtension on BuildContext {
  void pushAndClearStack(String path) {
    GoRouter.of(this).pushAndClearStack(path);
  }
  
  void goToHome() => go(AppConstants.homeRoute);
  void goToAuth() => go(AppConstants.authRoute);
  void goToOnboarding() => go(AppConstants.onboardingRoute);
  void goToFocus() => go(AppConstants.focusRoute);
  void goToStatistics() => go(AppConstants.statisticsRoute);
  void goToSettings() => go(AppConstants.settingsRoute);
  void goToProfile() => go(AppConstants.profileRoute);
  void goToAchievements() => go(AppConstants.achievementsRoute);
  
  void pushCreateSession() => push(AppConstants.createSessionRoute);
  void pushSessionTimer(String sessionId) => push(
    '${AppConstants.sessionTimerRoute}?sessionId=$sessionId',
  );
}

// Router Delegate Provider
final routerDelegateProvider = Provider<GoRouterDelegate>((ref) {
  final router = ref.watch(appRouterProvider);
  return router.routerDelegate;
});

// Route Information Provider
final routeInformationProvider = Provider<RouteInformationProvider>((ref) {
  final router = ref.watch(appRouterProvider);
  return router.routeInformationProvider;
});

// Route Information Parser Provider
final routeInformationParserProvider = Provider<RouteInformationParser<Object>>((ref) {
  final router = ref.watch(appRouterProvider);
  return router.routeInformationParser;
});

// Current Route Provider
final currentRouteProvider = Provider<String>((ref) {
  final router = ref.watch(appRouterProvider);
  return router.routeInformationProvider.value.uri.toString();
});

// Can Pop Provider
final canPopProvider = Provider<bool>((ref) {
  final router = ref.watch(appRouterProvider);
  return router.canPop();
});

// Navigation History Provider
class NavigationHistoryNotifier extends StateNotifier<List<String>> {
  NavigationHistoryNotifier() : super([]);

  void addRoute(String route) {
    state = [...state, route];
  }

  void removeLastRoute() {
    if (state.isNotEmpty) {
      state = state.sublist(0, state.length - 1);
    }
  }

  void clearHistory() {
    state = [];
  }

  String? get previousRoute => state.length > 1 ? state[state.length - 2] : null;
  String? get currentRoute => state.isNotEmpty ? state.last : null;
}

final navigationHistoryProvider = StateNotifierProvider<NavigationHistoryNotifier, List<String>>((ref) {
  return NavigationHistoryNotifier();
});

// Bottom Navigation Index Provider
final bottomNavigationIndexProvider = StateProvider<int>((ref) => 0);

// Bottom Navigation Routes
final bottomNavigationRoutes = [
  AppConstants.homeRoute,
  AppConstants.focusRoute,
  AppConstants.statisticsRoute,
  AppConstants.settingsRoute,
];

// Get Bottom Navigation Index from Route
int getBottomNavigationIndex(String route) {
  return bottomNavigationRoutes.indexOf(route).clamp(0, bottomNavigationRoutes.length - 1);
}

// Get Route from Bottom Navigation Index
String getRouteFromBottomNavigationIndex(int index) {
  return bottomNavigationRoutes[index.clamp(0, bottomNavigationRoutes.length - 1)];
}