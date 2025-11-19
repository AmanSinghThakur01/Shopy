import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopy/auth/loginpage.dart';
import 'package:shopy/presentation/user/screens/FirstPage.dart';
import '../custom widgets/Ui_helper.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup(String username, String email, String password) async {
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      UiHelper.customAlertBox(context, "Enter Required Fields");
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user?.updateDisplayName(username);
      await userCredential.user?.reload();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Firstpage()),
      );
    } on FirebaseAuthException catch (ex) {
      UiHelper.customAlertBox(context, ex.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              Text(
                "Create an\naccount",
                style: TextStyle(
                  fontSize: width * 0.09,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.03),

              UiHelper.customTextField(
                usernameController,
                "Username",
                Icons.person,
                false,
              ),
              SizedBox(height: height * 0.02),

              UiHelper.customTextField(
                emailController,
                "Email",
                Icons.email,
                false,
              ),
              SizedBox(height: height * 0.02),

              UiHelper.customTextField(
                passwordController,
                "Password",
                Icons.lock,
                true,
              ),
              SizedBox(height: height * 0.03),

              UiHelper.customElevatedButton(
                context,
                    () {
                  signup(
                    usernameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
                "Create Account",
              ),

              SizedBox(height: height * 0.03),

              Center(
                child: Text(
                  "- OR Continue with -",
                  style: TextStyle(fontSize: width * 0.035),
                ),
              ),

              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customIconButton(
                        () {},
                    Image.asset('assets/google_logo.png', width: 30),
                  ),
                  SizedBox(width: width * 0.04),
                  UiHelper.customIconButton(
                        () {},
                    Image.asset('assets/apple_logo.png', width: 30),
                  ),
                  SizedBox(width: width * 0.04),
                  UiHelper.customIconButton(
                        () {},
                    Image.asset('assets/facebook_logo.png', width: 30),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I Already Have an Account",
                    style: TextStyle(fontSize: width * 0.04),
                  ),
                  UiHelper.customTextButton(
                        () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Loginpage()),
                      );
                    },
                    'Login',
                    width * 0.04,
                    true,
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
