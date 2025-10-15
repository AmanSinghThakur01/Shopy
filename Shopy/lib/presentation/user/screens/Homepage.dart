import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy/auth/loginpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}


 LogOut() async {
  await FirebaseAuth.instance.signOut();
  
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopy",
          style: TextStyle(color: Colors.blueAccent, fontSize: 22.sp),
        ),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => LogOut(), // ✅ Pass context properly
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
