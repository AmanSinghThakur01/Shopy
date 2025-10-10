import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy/custom%20widgets/Ui_helper.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController EmailController  = TextEditingController();
  TextEditingController  passwordController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UiHelper.customtextfield(EmailController, "Email", Icons.mail, false),
          UiHelper.customtextfield(passwordController, "Password", Icons.password, true),
          SizedBox(height: 10.h,),
        ],
      ),
    );
  }
}
