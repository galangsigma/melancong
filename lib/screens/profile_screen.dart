// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fluterproject/consts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedNavIndex = 2;
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  final List<String> savedInterests = ['Music', 'Sports', 'Food', 'Travel'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFFf25aa6);
    final bgColor = isDark ? colorBlack : colorWhite;
    final surfaceColor = isDark ? const Color(0xFF2d1620) : Colors.white;
    final textColor = isDark ? colorWhite : colorBlack;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.settings, color: primaryColor),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Card
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Avatar
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  primaryColor,
                                  primaryColor.withValues(alpha: 0.7),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'john.doe@email.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor.withValues(alpha: 0.6),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Stats
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatItem('12', 'Events', textColor),
                              Container(
                                width: 1,
                                height: 40,
                                color: textColor.withValues(alpha: 0.1),
                              ),
                              _buildStatItem('28', 'Following', textColor),
                              Container(
                                width: 1,
                                height: 40,
                                color: textColor.withValues(alpha: 0.1),
                              ),
                              _buildStatItem('156', 'Followers', textColor),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // My Interests
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My Interests',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: savedInterests.map((interest) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: primaryColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: primaryColor.withValues(alpha: 0.3),
                                  ),
                                ),
                                child: Text(
                                  interest,
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Settings Section
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildSettingTile(
                            Icons.notifications_outlined,
                            'Notifications',
                            'Receive event updates',
                            Switch(
                              value: notificationsEnabled,
                              onChanged: (value) {
                                setState(() {
                                  notificationsEnabled = value;
                                });
                              },
                              activeThumbColor: primaryColor,
                            ),
                            textColor,
                          ),
                          Divider(
                            height: 1,
                            color: textColor.withValues(alpha: 0.1),
                          ),
                          _buildSettingTile(
                            Icons.location_on_outlined,
                            'Location',
                            'Semarang, Central Java',
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: textColor.withValues(alpha: 0.4),
                            ),
                            textColor,
                          ),
                          Divider(
                            height: 1,
                            color: textColor.withValues(alpha: 0.1),
                          ),
                          _buildSettingTile(
                            Icons.language,
                            'Language',
                            'English',
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: textColor.withValues(alpha: 0.4),
                            ),
                            textColor,
                          ),
                          Divider(
                            height: 1,
                            color: textColor.withValues(alpha: 0.1),
                          ),
                          _buildSettingTile(
                            Icons.privacy_tip_outlined,
                            'Privacy Policy',
                            'Read our privacy terms',
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: textColor.withValues(alpha: 0.4),
                            ),
                            textColor,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Logout Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _showLogoutDialog(context);
                          },
                          icon: const Icon(Icons.logout),
                          label: const Text('Logout'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(primaryColor, textColor, isDark),
    );
  }

  Widget _buildStatItem(String value, String label, Color textColor) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: textColor.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingTile(
    IconData icon,
    String title,
    String subtitle,
    Widget trailing,
    Color textColor,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFf25aa6).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFFf25aa6), size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: textColor.withValues(alpha: 0.6)),
      ),
      trailing: trailing,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle logout
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(Color primaryColor, Color textColor, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? colorBlack.withValues(alpha: 0.9)
            : colorWhite.withValues(alpha: 0.9),
        border: Border(
          top: BorderSide(
            color: isDark
                ? primaryColor.withValues(alpha: 0.3)
                : primaryColor.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0, primaryColor, textColor),
              _buildNavItem(
                Icons.confirmation_number,
                'Events',
                1,
                primaryColor,
                textColor,
              ),
              _buildNavItem(
                Icons.person,
                'Profile',
                2,
                primaryColor,
                textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    Color primaryColor,
    Color textColor,
  ) {
    final isSelected = selectedNavIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.pushNamed(context, '/home');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/events');
        } else {
          setState(() {
            selectedNavIndex = index;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryColor : textColor.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected
                  ? primaryColor
                  : textColor.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
