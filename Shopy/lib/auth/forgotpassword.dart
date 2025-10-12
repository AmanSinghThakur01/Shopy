import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy/custom%20widgets/Ui_helper.dart';
class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailcontroller = TextEditingController();
  forgotpassword(String email) async {
    if (email.isEmpty) {
      UiHelper.CustomAlertBox(context, "Enter an Email to reset Password");
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      UiHelper.CustomAlertBox(
          context, "✅ Password reset email sent! Check your inbox or spam folder.");
    } on FirebaseAuthException catch (e) {
      UiHelper.CustomAlertBox(context, e.message.toString());
    } catch (e) {
      UiHelper.CustomAlertBox(context, "Unexpected error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Forgot \nPassword?",
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8.h,),
              UiHelper.customtextfield(emailcontroller, " Enter your email address", Icons.mail, false),
              SizedBox(height: 15.h,),
              Text(" * We wil; send you a message to set or reset your new password ",style: TextStyle(fontSize: 12.sp),),
              SizedBox(height: 15.h,),
              UiHelper.customElevetedButton((){
                forgotpassword( emailcontroller.text.toString());
              }, " Submit"),
            ],
          ),
        ),
      )),
    );
  }
}
