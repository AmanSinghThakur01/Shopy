import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopy/auth/Signup_page.dart';
import 'package:shopy/auth/forgotpassword.dart';
import 'package:shopy/custom widgets/Ui_helper.dart';
import 'package:shopy/presentation/user/screens/FirstPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    if (email == "" && password == "") {
      return UiHelper.customAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then(
              (value) {
            return Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Firstpage()),
            );
          },
        );
      } on FirebaseAuthException catch (ex) {
        return UiHelper.customAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.06),
              Text(
                "Welcome\nback!",
                style: TextStyle(
                  fontSize: width * 0.09,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.03),

              UiHelper.customTextField(
                emailController,
                "Username or Email",
                Icons.person,
                false,
              ),

              SizedBox(height: height * 0.02),

              UiHelper.customTextField(
                passwordController,
                "Password",
                Icons.lock,
                true,
              ),

              SizedBox(height: height * 0.01),

              Align(
                alignment: Alignment.topRight,
                child: UiHelper.customTextButton(
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Forgotpassword()),
                    );
                  },
                  'Forgot Password?',
                  width * 0.035,
                  false,
                ),
              ),

              SizedBox(height: height * 0.03),

              UiHelper.customElevatedButton(
                context,
                    () {
                  login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
                "Login",
              ),

              SizedBox(height: height * 0.03),

              Center(
                child: Text(
                  "- OR Continue with -",
                  style: TextStyle(fontSize: width * 0.035),
                ),
              ),

              SizedBox(height: height * 0.03),

              // FIXED: Corrected 'zzImage' to 'Image'
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customIconButton(
                          () {},
                      Image.asset('assets/google_logo.png')
                  ),
                  SizedBox(width: width * 0.04),
                  UiHelper.customIconButton(
                          () {},
                      Image.asset('assets/apple_logo.png')
                  ),
                  SizedBox(width: width * 0.04),
                  UiHelper.customIconButton(
                          () {},
                      Image.asset('assets/facebook_logo.png')
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create An Account",
                    style: TextStyle(fontSize: width * 0.04),
                  ),
                  UiHelper.customTextButton(
                        () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Signuppage()),
                      );
                    },
                    'Sign Up',
                    width * 0.04,
                    true,
                  ),
                ],
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}