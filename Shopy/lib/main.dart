// import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:shopy/auth/login_status_checker.dart';
// import 'package:shopy/auth/loginpage.dart';
// import 'package:shopy/presentation/user/screens/FirstPage.dart';
// import 'package:shopy/presentation/user/screens/onboarding/onboarding_screen.dart';
// import 'package:shopy/responsive/responsive.dart';
// import 'presentation/user/screens/splash/splash_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//     statusBarIconBrightness: Brightness.dark,
//     systemNavigationBarColor: Colors.transparent,
//     systemNavigationBarIconBrightness: Brightness.dark,
//   ));
//
//
//   runApp(
//     const MyApp(),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//      home: const SplashScreeen(),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:shopy/presentation/user/screens/FirstPage.dart';
import 'package:provider/provider.dart';
import 'package:shopy/provider/api_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=> ApiProvider()),],
      child: const  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Firstpage(),
    );
  }
}
