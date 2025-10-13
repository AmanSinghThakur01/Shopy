import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopy/auth/login_status_checker.dart';
import 'presentation/user/screens/splash/splash_screen.dart';
import 'provider/onboarding_screen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => OnboardingProvider(),),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize: const Size(360, 690),
     minTextAdapt: true,
     builder: (context , child){

       return MaterialApp(
       home: SafeArea(child: LoginStatusChecker()),

         );
     },
   );
  }}


