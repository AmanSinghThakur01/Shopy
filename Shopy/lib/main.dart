import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopy/auth/login_status_checker.dart';
import 'package:shopy/presentation/user/screens/FirstPage.dart';
import 'package:shopy/presentation/user/screens/HomeScreen.dart';
import 'package:shopy/presentation/user/screens/splash/splash_screen.dart';
import 'package:shopy/provider/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ✅ Single function to check Firebase + user login status
  Future<Widget> _checkUserStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 1)); // optional small delay
    if (user == null) {
      return const Firstpage(); // onboarding or login
    } else {
      return Firstpage(); // already logged in
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
            future: _checkUserStatus(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SplashScreeen(); // ya CircularProgressIndicator()
              } else if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              } else {
                return snapshot.data ?? const SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
