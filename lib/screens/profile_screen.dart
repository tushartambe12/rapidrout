import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Profile Header
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Profile Avatar
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text('👤', style: TextStyle(fontSize: 50)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Prachi Mulgaonkar',
                      style: AppTextStyles.heading2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '+91 98765 43210',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Stats Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem('12', 'Orders'),
                        Container(width: 1, height: 30, color: Colors.white30),
                        _buildStatItem('5', 'Bookings'),
                        Container(width: 1, height: 30, color: Colors.white30),
                        _buildStatItem('₹2.5K', 'Saved'),
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
                _buildMenuSection('My Account', [
                  _MenuItemData(Icons.person_outline, 'Edit Profile', () {}),
                  _MenuItemData(
                    Icons.location_on_outlined,
                    'My Addresses',
                    () {},
                  ),
                  _MenuItemData(
                    Icons.payment_outlined,
                    'Payment Methods',
                    () {},
                  ),
                ]),
                const SizedBox(height: 20),
                _buildMenuSection('My Activity', [
                  _MenuItemData(
                    Icons.shopping_bag_outlined,
                    'My Orders',
                    () {},
                    badge: '3',
                  ),
                  _MenuItemData(
                    Icons.calendar_today_outlined,
                    'My Bookings',
                    () {},
                    badge: '2',
                  ),
                  _MenuItemData(Icons.favorite_outline, 'Wishlist', () {}),
                ]),
                const SizedBox(height: 20),
                _buildMenuSection('Settings', [
                  _MenuItemData(
                    Icons.notifications_outlined,
                    'Notifications',
                    () {},
                  ),
                  _MenuItemData(
                    Icons.language,
                    'Language',
                    () {},
                    trailing: 'English',
                  ),
                  _MenuItemData(
                    Icons.dark_mode_outlined,
                    'Dark Mode',
                    () {},
                    isSwitch: true,
                  ),
                ]),
                const SizedBox(height: 20),
                _buildMenuSection('Support', [
                  _MenuItemData(Icons.help_outline, 'Help & FAQ', () {}),
                  _MenuItemData(Icons.chat_outlined, 'Contact Us', () {}),
                  _MenuItemData(Icons.info_outline, 'About Us', () {}),
                ]),
                const SizedBox(height: 20),
                // Logout Button
                Container(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
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
                    'QuickServe v1.0.0',
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

  Widget _buildMenuSection(String title, List<_MenuItemData> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(title, style: AppTextStyles.bodySmall),
          ),
          ...items.map((item) => _buildMenuItem(item)).toList(),
        ],
      ),
    );
  }

  Widget _buildMenuItem(_MenuItemData item) {
    return ListTile(
      onTap: item.onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(item.icon, color: AppColors.primary, size: 20),
      ),
      title: Text(item.title, style: AppTextStyles.bodyLarge),
      trailing: item.isSwitch
          ? Switch(
              value: false,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item.badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      item.badge!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (item.trailing != null)
                  Text(
                    item.trailing!,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textLight,
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
  final String? badge;
  final String? trailing;
  final bool isSwitch;

  _MenuItemData(
    this.icon,
    this.title,
    this.onTap, {
    this.badge,
    this.trailing,
    this.isSwitch = false,
  });
}
