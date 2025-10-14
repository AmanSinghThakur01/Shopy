import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShopyDrawer(),
      appBar: AppBar(
        title: Text("Shopy",style: TextStyle(color: Colors.blueAccent, fontSize: 22.sp),),
        actions: [
          Icon(Icons.person),
        ],
      ),
      body: Center(
        child: Text(" homepage"),
      ),
    );
  }
}
class ShopyDrawer extends StatelessWidget {
  const ShopyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:
        [
          // Drawer Header
          UserAccountsDrawerHeader(
            accountName: const Text("Buddy"),
            accountEmail: const Text("buddy@example.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
            ),
          ),

          // Drawer Items
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Logout'),
            onTap: () {
              // Add logout logic here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
