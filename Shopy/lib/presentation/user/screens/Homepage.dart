import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy/auth/loginpage.dart';
import 'package:shopy/core/app_constants.dart';

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
        centerTitle: true,
        title: Text(

          "Shopy",
          style: TextStyle(color: Colors.blueAccent, fontSize: 22.sp,fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(12.w),
        child: Column(
          children: [
            TextField(

              decoration: InputDecoration(
                hintText: "Search any Product..",
                suffixIcon: Icon(Icons.mic,color: AppColors.background,),
                prefixIcon: Icon(Icons.search, color: AppColors.background),
                border: OutlineInputBorder(
                )
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => LogOut(), // ✅ Pass context properly
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
