import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy/auth/loginpage.dart';
import 'package:shopy/custom%20widgets/Ui_helper.dart';
import 'package:shopy/presentation/user/screens/Homepage.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}


class _SignuppageState extends State<Signuppage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 signup(  String email , String password)async{
   if(email =="" && password ==""){
     UiHelper.CustomAlertBox(context, " Enter Required Fields");
   }
   else {
     UserCredential? userCredential ;
     try {
       userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
         Navigator.push(context,MaterialPageRoute(builder: (context)=> Homepage()));
       });
     }
     on FirebaseAuthException catch( ex){
       return
           UiHelper.CustomAlertBox(context, ex.code.toString());
     }
   }

 }

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
                    "Create an \n account",
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.h,),

                UiHelper.customtextfield(
                  emailController,
                  "Username or Email",
                  Icons.person,
                  false,
                ),



                UiHelper.customtextfield(
                  passwordController,
                  "Password",
                  Icons.lock,
                  true,
                ),


                SizedBox(height: 8.h),

                SizedBox(height: 20.h),

                UiHelper.customElevetedButton(() {
                  signup(emailController.text.toString(), passwordController.text.toString());
                }, "Create Account"),

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
                      "I Already Have an Account",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    UiHelper.customtextbutton(
                          () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage(),));
                      },
                      'Login',
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

