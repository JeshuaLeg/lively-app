import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            _buildProfileSection(context),
            const SizedBox(height: 24),
            
            // App Settings
            _buildAppSettingsSection(context, ref),
            const SizedBox(height: 24),
            
            // Focus Settings
            _buildFocusSettingsSection(context),
            const SizedBox(height: 24),
            
            // Account Settings
            _buildAccountSettingsSection(context),
            const SizedBox(height: 24),
            
            // Support
            _buildSupportSection(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppConstants.homeRoute);
              break;
            case 1:
              context.go(AppConstants.focusRoute);
              break;
            case 2:
              context.go(AppConstants.statisticsRoute);
              break;
            case 3:
              context.go(AppConstants.settingsRoute);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: AppTheme.primaryColor,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: const Text('John Doe'),
        subtitle: const Text('john.doe@email.com'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          context.go(AppConstants.profileRoute);
        },
      ),
    );
  }

  Widget _buildAppSettingsSection(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'App Settings',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable dark theme'),
            value: ref.isDarkMode,
            onChanged: (value) {
              ref.read(themeModeProvider.notifier).toggleTheme();
            },
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Receive focus reminders'),
            value: true,
            onChanged: (value) {
              // TODO: Toggle notifications
            },
          ),
          SwitchListTile(
            title: const Text('Sounds'),
            subtitle: const Text('Play sounds for session events'),
            value: true,
            onChanged: (value) {
              // TODO: Toggle sounds
            },
          ),
          SwitchListTile(
            title: const Text('Vibration'),
            subtitle: const Text('Vibrate for notifications'),
            value: true,
            onChanged: (value) {
              // TODO: Toggle vibration
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFocusSettingsSection(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Focus Settings',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Default Session Duration'),
            subtitle: const Text('25 minutes'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Show duration picker
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Default Difficulty'),
            subtitle: const Text('Normal'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Show difficulty selector
            },
          ),
          ListTile(
            leading: const Icon(Icons.block),
            title: const Text('Blocked Apps'),
            subtitle: const Text('Manage blocked applications'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to blocked apps
            },
          ),
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text('Daily Goal'),
            subtitle: const Text('2 hours'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Show goal picker
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettingsSection(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Upgrade to Pro'),
            subtitle: const Text('Unlock premium features'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Show upgrade dialog
            },
          ),
          ListTile(
            leading: const Icon(Icons.backup),
            title: const Text('Backup & Sync'),
            subtitle: const Text('Sync data across devices'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to backup settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy'),
            subtitle: const Text('Manage privacy settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to privacy settings
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Support',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help Center'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Open help center
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Send Feedback'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Open feedback form
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Show about dialog
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
            onTap: () {
              _showSignOutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Implement sign out
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sign out functionality coming soon!')),
              );
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}