import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopy/auth/loginpage.dart';
import 'package:shopy/presentation/user/screens/FirstPage.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userName = user?.displayName ?? "Guest User";
    final userEmail = user?.email ?? "guest@example.com";

    void navigateTo(int index) {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => Firstpage(index: index),
        ),
            (route) => false,
      );
    }

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
                const SizedBox(height: 12),
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
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
            onTap: () => navigateTo(0),
          ),

          ListTile(
            leading: Icon(Icons.favorite, color: Colors.pink.shade300),
            title: const Text("Wishlist"),
            onTap: () => navigateTo(1),
          ),

          ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.pink.shade300),
            title: const Text("My Cart"),
            onTap: () => navigateTo(2),
          ),

          ListTile(
            leading: Icon(Icons.search, color: Colors.pink.shade300),
            title: const Text("Search"),
            onTap: () => navigateTo(3),
          ),


          ListTile(
            leading: Icon(Icons.settings, color: Colors.pink),
            title: const Text("Settings"),
            onTap: () => navigateTo(4),
          ),

          const Divider(),


          ListTile(
            leading: Icon(Icons.logout, color: Colors.red.shade400),
            title: const Text("Logout"),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Row(
                    children: [
                      Icon(Icons.warning_amber_rounded,
                          color: Colors.orange.shade400),
                      const SizedBox(width: 10),
                      const Text("Logout"),
                    ],
                  ),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade300,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Loginpage(),
                          ),
                              (route) => false,
                        );
                      },
                      child: const Text("Logout",style: TextStyle( color: Colors.white),),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}