import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopy/custom widgets/Ui_helper.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailcontroller = TextEditingController();

  forgotpassword(String email) async {
    if (email.isEmpty) {
      UiHelper.customAlertBox(context, "Enter an Email to reset Password");
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      UiHelper.customAlertBox(
          context, "✅ Password reset email sent! Check your inbox or spam folder.");
    } on FirebaseAuthException catch (e) {
      UiHelper.customAlertBox(context, e.message.toString());
    } catch (e) {
      UiHelper.customAlertBox(context, "Unexpected error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.015,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.05),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Forgot \nPassword?",
                    style: TextStyle(
                      fontSize: size.width * 0.09,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                UiHelper.customTextField(
                    emailcontroller,
                    " Enter your email address",
                    Icons.mail,
                    false),
                SizedBox(height: size.height * 0.02),
                Text(
                  "* We will send you a message to set or reset your new password",
                  style: TextStyle(fontSize: size.width * 0.03),
                ),
                SizedBox(height: size.height * 0.02),
                UiHelper.customElevatedButton(
                  context,
                      () {
                    forgotpassword(emailcontroller.text.toString());
                  },
                  " Submit",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
