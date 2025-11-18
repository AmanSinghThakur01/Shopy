import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopy/presentation/user/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    // Navigate
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Logo Card (Premium look)
              Container(
                height: size.width * 0.42,
                width: size.width * 0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.pinkAccent,
                  size: size.width * 0.26,
                ),
              ),

              SizedBox(height: size.height * 0.04),

              /// App Name
              Text(
                "SHOPY",
                style: TextStyle(
                  fontSize: size.width * 0.125,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                  letterSpacing: 2,
                ),
              ),

              SizedBox(height: size.height * 0.005),

              /// Tagline
              Text(
                "Shop • Discover • Enjoy",
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),

              SizedBox(height: size.height * 0.10),

              /// Developer Name
              Text(
                "Developed by : Aman Singh Thakur",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: size.width * 0.035,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
