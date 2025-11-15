import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopy/auth/loginpage.dart';
import 'package:shopy/presentation/user/screens/CartScreen.dart';
import 'package:shopy/presentation/user/screens/HomeScreen.dart';
import 'package:shopy/presentation/user/screens/Setting_Screen.dart';
import 'package:shopy/presentation/user/screens/WishlistScreen.dart';
import 'package:shopy/widgets/order_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userName = user?.displayName ?? "Guest User";
    final userEmail = user?.email ?? "guest@example.com";

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade300, Colors.pink.shade100],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 32, color: Colors.pink),
                ),
                SizedBox(height: 12),
                Text(
                  userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  userEmail,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.pink.shade300),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const Homescreen();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.pink.shade300),
            title: const Text("My Cart"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const Cartscreen();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.pink.shade300),
            title: const Text("Wishlist"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const Wishlistscreen();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Colors.pink.shade300),
            title: const Text("My Orders"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const OrderScreen();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.pink.shade300),
            title: const Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const Homescreen();
                }),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey.shade600),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SettingScreen();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red.shade400),
            title: const Text("Logout"),
            onTap: () {
              // Dialog dikhao - pehle confirm karo
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: Row(
                      children: [
                        Icon(Icons.warning_amber_rounded,
                            color: Colors.orange.shade400, size: 28),
                        const SizedBox(width: 10),
                        const Text('Logout'),
                      ],
                    ),
                    content: const Text(
                      'Are you sure you want to logout?',
                      style: TextStyle(fontSize: 16),
                    ),
                    actions: [
                      // Cancel button
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dialog band karo
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 16),
                        ),
                      ),
                      // Logout button
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).pop(); // Dialog band karo
                          Navigator.of(context).pop(); // Drawer band karo

                          // Firebase se logout karo
                          await FirebaseAuth.instance.signOut();

                          // Login screen pe jao
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const Loginpage();
                              }),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}