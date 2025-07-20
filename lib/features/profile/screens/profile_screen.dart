import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/providers/auth_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _notificationsEnabled = true;
  bool _appUninstallProtection = false;
  bool _pinCodeProtection = false;
  
  // Sample user data
  final Map<String, dynamic> _userProfile = {
    'gemName': 'mrbuff',
    'phone': '+19785875597',
    'profession': 'Software Development',
    'age': '25 - 34',
    'isPro': true,
  };

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
              Color(0xFF0A0E27),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildProBanner(),
                _buildPreferencesSection(),
                _buildAccountSection(),
                _buildSocialSection(),
                _buildOpalForMacSection(),
                _buildHelpSupportSection(),
                const SizedBox(height: 100), // Space for bottom nav
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProBanner() {
    if (!_userProfile['isPro']) return const SizedBox.shrink();
    
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF26C6DA),
            Color(0xFF00BCD4),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.gemTeal,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.bolt,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'You\'re a Lively Pro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.diamond,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Thanks for supporting our mission!',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'View Benefits',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            'PREFERENCES',
            style: TextStyle(
              color: AppTheme.mutedGray,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ),
        _buildSettingsCard([
          _buildSettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: AppTheme.gemBlue,
            ),
            subtitle: _notificationsEnabled ? 'On' : 'Off',
          ),
          _buildSettingsTile(
            icon: Icons.bolt,
            title: 'Customize Block Screens',
            subtitle: 'Select options for block screen overlays that appear when you block an app with Lively.',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppTheme.gemPink.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    Icons.block,
                    color: AppTheme.gemPink,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.mutedGray,
                  size: 16,
                ),
              ],
            ),
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.security,
            title: 'App Uninstall Protection',
            subtitle: 'During Sessions, you won\'t be able to uninstall Lively or other apps, or change your phone\'s time/date.',
            trailing: Switch(
              value: _appUninstallProtection,
              onChanged: (value) {
                setState(() {
                  _appUninstallProtection = value;
                });
              },
              activeColor: AppTheme.gemBlue,
            ),
          ),
          _buildSettingsTile(
            icon: Icons.lock,
            title: 'Pin Code Protection',
            subtitle: 'Off',
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
        ]),
      ],
    );
  }

  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            'ACCOUNT',
            style: TextStyle(
              color: AppTheme.mutedGray,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ),
        _buildSettingsCard([
          _buildSettingsTile(
            icon: Icons.person,
            title: 'Profile Photo',
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.diamond,
            title: 'Gem Name',
            subtitle: _userProfile['gemName'],
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.phone,
            title: 'Phone',
            subtitle: _userProfile['phone'],
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.work,
            title: 'Profession',
            subtitle: _userProfile['profession'],
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.cake,
            title: 'Age',
            subtitle: _userProfile['age'],
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.logout,
            title: 'Log Out',
            textColor: AppTheme.gemPink,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {
              _showLogoutDialog();
            },
          ),
        ]),
      ],
    );
  }

  Widget _buildSocialSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            'SOCIAL',
            style: TextStyle(
              color: AppTheme.mutedGray,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ),
        _buildSettingsCard([
          _buildSettingsTile(
            icon: Icons.share,
            title: 'Share Lively',
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.people,
            title: 'Friends',
            subtitle: 'Find your friends who use Lively',
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
        ]),
      ],
    );
  }

  Widget _buildOpalForMacSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            'LIVELY FOR MAC',
            style: TextStyle(
              color: AppTheme.mutedGray,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ),
        _buildSettingsCard([
          _buildSettingsTile(
            icon: Icons.download,
            title: 'Install Mac App',
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.qr_code,
            title: 'Scan QR Code',
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
        ]),
      ],
    );
  }

  Widget _buildHelpSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            'HELP & SUPPORT',
            style: TextStyle(
              color: AppTheme.mutedGray,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ),
        _buildSettingsCard([
          _buildSettingsTile(
            icon: Icons.help_outline,
            title: 'Contact Us',
            subtitle: 'Ask questions and learn how to use Lively',
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.help,
            title: 'FAQs',
            subtitle: 'All articles to use Lively better',
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.mutedGray,
              size: 16,
            ),
            onTap: () {},
          ),
        ]),
        
        // Version info
        Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Text(
              'LIVELY V3.118',
              style: TextStyle(
                color: AppTheme.mutedGray,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppTheme.accentBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: textColor ?? AppTheme.softWhite,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? AppTheme.softWhite,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: subtitle != null
          ? Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                subtitle,
                style: TextStyle(
                  color: AppTheme.mutedGray,
                  fontSize: 14,
                  height: 1.3,
                ),
              ),
            )
          : null,
      trailing: trailing,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppTheme.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Log Out',
            style: TextStyle(
              color: AppTheme.softWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Are you sure you want to log out?',
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
              onPressed: () {
                Navigator.of(context).pop();
                // Handle logout
                ref.read(authStateProvider.notifier).signOut();
                context.go(AppConstants.authRoute);
              },
              child: Text(
                'Log Out',
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