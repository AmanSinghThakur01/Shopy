import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopy/auth/loginpage.dart';
import 'package:shopy/presentation/user/screens/FirstPage.dart';


class LoginStatusChecker extends StatefulWidget {
  const LoginStatusChecker({super.key});

  @override
  State<LoginStatusChecker> createState() => _LoginStatusCheckerState();
}

class _LoginStatusCheckerState extends State<LoginStatusChecker> {
  @override
  Widget build(BuildContext context) {
    return checkuser();

  }
  checkuser()async {
    final user =  FirebaseAuth.instance.currentUser;
    if (user!= null){
      return Firstpage();
    }
    else {
      return Loginpage();
    }
  }
}
