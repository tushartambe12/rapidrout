import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../models/user_state.dart';
import '../models/cart_state.dart';
import '../models/theme_state.dart';
import 'login_screen.dart';
import 'placeholder_screen.dart';
import 'edit_profile_screen.dart';
import 'payment_methods_screen.dart';
import 'wishlist_screen.dart';
import 'my_orders_screen.dart';
import 'my_bookings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    userState.addListener(_onStateChanged);
    cartState.addListener(_onStateChanged);
    themeState.addListener(_onStateChanged);
  }

  @override
  void dispose() {
    userState.removeListener(_onStateChanged);
    cartState.removeListener(_onStateChanged);
    themeState.removeListener(_onStateChanged);
    super.dispose();
  }

  void _onStateChanged() {
    setState(() {});
  }

  void _navigateTo(String title, IconData icon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceholderScreen(title: title, icon: icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = Theme.of(context).cardColor;
    final textColor = isDark ? Colors.white : AppColors.textPrimary;
    final subtextColor = isDark ? Colors.white60 : AppColors.textSecondary;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // Profile Header
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    // Profile Avatar
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text('👤', style: TextStyle(fontSize: 50)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      userState.userName.isNotEmpty
                          ? userState.userName
                          : 'Guest User',
                      style: AppTextStyles.heading2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userState.phoneNumber.isNotEmpty
                          ? userState.phoneNumber
                          : 'No phone number',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Dynamic Stats Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem('${cartState.itemCount}', 'In Cart'),
                        Container(width: 1, height: 30, color: Colors.white30),
                        _buildStatItem('${cartState.items.length}', 'Items'),
                        Container(width: 1, height: 30, color: Colors.white30),
                        _buildStatItem(
                          '₹${cartState.total.toStringAsFixed(0)}',
                          'Total',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Menu Items
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildMenuSection(
                  'My Account',
                  [
                    _MenuItemData(
                      Icons.person_outline,
                      'Edit Profile',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      ),
                    ),

                    _MenuItemData(
                      Icons.payment_outlined,
                      'Payment Methods',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentMethodsScreen(),
                        ),
                      ),
                    ),
                  ],
                  cardColor,
                  textColor,
                  subtextColor,
                ),
                const SizedBox(height: 20),
                _buildMenuSection(
                  'My Activity',
                  [
                    _MenuItemData(
                      Icons.shopping_bag_outlined,
                      'My Orders',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyOrdersScreen(),
                        ),
                      ),
                    ),
                    _MenuItemData(
                      Icons.calendar_today_outlined,
                      'My Bookings',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyBookingsScreen(),
                        ),
                      ),
                    ),
                    _MenuItemData(
                      Icons.favorite_outline,
                      'Wishlist',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WishlistScreen(),
                        ),
                      ),
                    ),
                  ],
                  cardColor,
                  textColor,
                  subtextColor,
                ),
                const SizedBox(height: 20),
                // Settings section with dark mode toggle built-in
                _buildSettingsSection(cardColor, textColor, subtextColor),
                const SizedBox(height: 20),
                _buildMenuSection(
                  'Support',
                  [
                    _MenuItemData(
                      Icons.help_outline,
                      'Help & FAQ',
                      () => _navigateTo('Help & FAQ', Icons.help_outline),
                    ),
                    _MenuItemData(
                      Icons.chat_outlined,
                      'Contact Us',
                      () => _navigateTo('Contact Us', Icons.chat_outlined),
                    ),
                    _MenuItemData(
                      Icons.info_outline,
                      'About Us',
                      () => _navigateTo('About Us', Icons.info_outline),
                    ),
                  ],
                  cardColor,
                  textColor,
                  subtextColor,
                ),
                const SizedBox(height: 20),
                // Logout Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      userState.logout();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.logout, color: AppColors.error),
                    label: Text(
                      'Logout',
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppColors.error),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // App Version
                Center(
                  child: Text(
                    'RapidRoute v1.0.0',
                    style: AppTextStyles.caption,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.heading3.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(color: Colors.white70),
        ),
      ],
    );
  }

  /// Settings section with a real Dark Mode switch
  Widget _buildSettingsSection(
    Color cardColor,
    Color textColor,
    Color subtextColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Settings',
              style: AppTextStyles.bodySmall.copyWith(color: subtextColor),
            ),
          ),
          // Notifications
          _buildMenuItem(
            _MenuItemData(
              Icons.notifications_outlined,
              'Notifications',
              () => _navigateTo('Notifications', Icons.notifications_outlined),
            ),
            textColor,
          ),
          // Language
          _buildMenuItem(
            _MenuItemData(
              Icons.language,
              'Language',
              () => _navigateTo('Language', Icons.language),
              trailing: 'English',
            ),
            textColor,
          ),
          // Dark Mode — with a real working switch
          ListTile(
            onTap: () => themeState.toggle(),
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                themeState.isDarkMode
                    ? Icons.dark_mode
                    : Icons.dark_mode_outlined,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            title: Text(
              'Dark Mode',
              style: AppTextStyles.bodyLarge.copyWith(color: textColor),
            ),
            trailing: Switch(
              value: themeState.isDarkMode,
              onChanged: (value) => themeState.setDarkMode(value),
              activeThumbColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(
    String title,
    List<_MenuItemData> items,
    Color cardColor,
    Color textColor,
    Color subtextColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: AppTextStyles.bodySmall.copyWith(color: subtextColor),
            ),
          ),
          ...items.map((item) => _buildMenuItem(item, textColor)),
        ],
      ),
    );
  }

  Widget _buildMenuItem(_MenuItemData item, Color textColor) {
    return ListTile(
      onTap: item.onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(item.icon, color: AppColors.primary, size: 20),
      ),
      title: Text(
        item.title,
        style: AppTextStyles.bodyLarge.copyWith(color: textColor),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.trailing != null)
            Text(
              item.trailing!,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: textColor.withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final String? trailing;

  _MenuItemData(this.icon, this.title, this.onTap, {this.trailing});
}
