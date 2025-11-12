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
  void initState() {
    super.initState();
    // Splash screen after 3 sec navigate to onboarding page
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF48FB1),
              Color(0xFFCE93D8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo container with shadow
              Container(
                height: height * 0.30,
                width: height * 0.30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.shopping_bag_rounded,
                  color: const Color(0xFFF06292),
                  size: height * 0.18,
                ),
              ),

              SizedBox(height: height * 0.05),

              // App name
              Text(
                "SHOPY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              SizedBox(height: height * 0.01),

              // Tagline
              Text(
                "S H O P  W I T H  S T Y L E",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.045,
                  letterSpacing: 2,
                ),
              ),

              SizedBox(height: height * 0.08),

              // Developer credit
              Text(
                "Developed by : Aman Singh Thakur",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: width * 0.035,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
