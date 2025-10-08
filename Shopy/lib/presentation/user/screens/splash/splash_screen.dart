import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy/core/app_constants.dart';
import 'package:shopy/presentation/user/screens/onboarding/onboarding_screen.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
    super.initState();
    //splash screen after 3 sec navigate to home page
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.pink.shade200,
                  Colors.purple.shade200,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300.h,
                width: 300.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink.shade200,
                ),
                child: Icon(Icons.shopping_bag_rounded, color: Colors.white, size: 150.h),
              ),
              Text("SHOPY", style: TextStyle(color: Colors.white,fontSize: 50.sp,fontWeight:FontWeight.bold),),
              Text("S H O P  W I T H  S T Y L E", style: TextStyle(color: Colors.white,fontSize: 18.sp,),),
            ],
          ),
        ),
      ),
    );
  }
}