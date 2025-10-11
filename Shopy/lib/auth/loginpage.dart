import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy/auth/Signup_page.dart';
import 'package:shopy/custom%20widgets/Ui_helper.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Welcome\nback!",
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                UiHelper.customtextfield(
                  emailController,
                  "Username or Email",
                  Icons.person,
                  false,
                ),

                SizedBox(height: 15.h),

                UiHelper.customtextfield(
                  passwordController,
                  "Password",
                  Icons.lock,
                  true,
                ),

                SizedBox(height: 8.h),

                Align(
                  alignment: Alignment.topRight,
                  child: UiHelper.customtextbutton(
                        () {},
                    'Forgot Password?',
                    12.sp,
                    false,
                  ),
                ),

                SizedBox(height: 20.h),

                UiHelper.customElevetedButton(() {}, "Login"),

                SizedBox(height: 25.h),

                Text(
                  "- OR Continue with -",
                  style: TextStyle(fontSize: 12.sp),
                ),

                SizedBox(height: 20.h),

                // Social login buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UiHelper.CustomIconButton(
                          () {},
                      Image.asset('assets/google_logo.png'),
                    ),
                    SizedBox(width: 10.w),
                    UiHelper.CustomIconButton(
                          () {},
                      Image.asset('assets/apple_logo.png'),
                    ),
                    SizedBox(width: 10.w),
                    UiHelper.CustomIconButton(
                          () {},
                      Image.asset('assets/facebook_logo.png'),
                    ),
                  ],
                ),

                SizedBox(height: 25.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create An Account",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    UiHelper.customtextbutton(
                          () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signuppage(),));
                            },
                      'Sign Up',
                      14.sp,
                      true,
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
              ],
            ),
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

