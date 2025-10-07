import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopy/core/app_constants.dart';
import 'package:shopy/presentation/user/screens/onboarding/onboarding_screen.dart';
class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //splash screen after 33 sec navigate to home page
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingScreen(),));
    },);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(" Shopy" ,style: TextStyle( fontSize: 35),)),
          ],
        ),
      ),
    );
  }
}