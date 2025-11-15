import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _orderUpdates = true;
  bool _promotions = false;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Shopy",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Section
          _buildSectionTitle("Account"),
          _buildSettingsTile(
            icon: Icons.person_outline,
            title: "Edit Profile",
            subtitle: "Change your profile information",
            onTap: () {
              // Navigate to profile edit screen
            },
          ),
          _buildSettingsTile(
            icon: Icons.location_on_outlined,
            title: "Saved Addresses",
            subtitle: "Manage your delivery addresses",
            onTap: () {
              // Navigate to addresses screen
            },
          ),
          _buildSettingsTile(
            icon: Icons.payment_outlined,
            title: "Payment Methods",
            subtitle: "Manage your payment options",
            onTap: () {
              // Navigate to payment methods screen
            },
          ),
          const SizedBox(height: 20),

          // Notifications Section
          _buildSectionTitle("Notifications"),
          _buildSwitchTile(
            icon: Icons.notifications_outlined,
            title: "Push Notifications",
            subtitle: "Enable push notifications",
            value: _notificationsEnabled,
            onChanged: (val) {
              setState(() {
                _notificationsEnabled = val;
              });
            },
          ),
          _buildSwitchTile(
            icon: Icons.email_outlined,
            title: "Email Notifications",
            subtitle: "Receive emails about orders",
            value: _emailNotifications,
            onChanged: (val) {
              setState(() {
                _emailNotifications = val;
              });
            },
          ),
          _buildSwitchTile(
            icon: Icons.local_shipping_outlined,
            title: "Order Updates",
            subtitle: "Get notified about order status",
            value: _orderUpdates,
            onChanged: (val) {
              setState(() {
                _orderUpdates = val;
              });
            },
          ),
          _buildSwitchTile(
            icon: Icons.local_offer_outlined,
            title: "Promotions & Offers",
            subtitle: "Receive promotional notifications",
            value: _promotions,
            onChanged: (val) {
              setState(() {
                _promotions = val;
              });
            },
          ),
          const SizedBox(height: 20),

          // Preferences Section
          _buildSectionTitle("Preferences"),
          _buildSwitchTile(
            icon: Icons.dark_mode_outlined,
            title: "Dark Mode",
            subtitle: "Switch to dark theme",
            value: _darkMode,
            onChanged: (val) {
              setState(() {
                _darkMode = val;
              });
            },
          ),
          _buildSettingsTile(
            icon: Icons.language_outlined,
            title: "Language",
            subtitle: "English",
            onTap: () {
              // Show language selection dialog
            },
          ),
          _buildSettingsTile(
            icon: Icons.attach_money_outlined,
            title: "Currency",
            subtitle: "USD",
            onTap: () {
              // Show currency selection dialog
            },
          ),
          const SizedBox(height: 20),

          // Support Section
          _buildSectionTitle("Support & Legal"),
          _buildSettingsTile(
            icon: Icons.help_outline,
            title: "Help Center",
            subtitle: "Get help with your orders",
            onTap: () {
              // Navigate to help center
            },
          ),
          _buildSettingsTile(
            icon: Icons.info_outline,
            title: "About",
            subtitle: "App version 1.0.0",
            onTap: () {
              // Show about dialog
            },
          ),
          _buildSettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: "Privacy Policy",
            subtitle: "Read our privacy policy",
            onTap: () {
              // Navigate to privacy policy
            },
          ),
          _buildSettingsTile(
            icon: Icons.description_outlined,
            title: "Terms & Conditions",
            subtitle: "Read our terms",
            onTap: () {
              // Navigate to terms
            },
          ),
          const SizedBox(height: 20),

          // Logout Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                _showLogoutDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: SwitchListTile(
        secondary: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blueAccent,
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Perform logout action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}