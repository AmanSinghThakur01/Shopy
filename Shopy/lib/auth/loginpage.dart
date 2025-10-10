import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy/custom%20widgets/Ui_helper.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController  = TextEditingController();
  TextEditingController  passwordController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(

            children: [
              SizedBox(height: 50.h,),
              Align(alignment: Alignment.topLeft, child: Text("Welcome \n back!",style: TextStyle(fontSize: 50.sp),)),
              UiHelper.customtextfield(emailController, " Username or Email",Icons.person ,false),
              UiHelper.customtextfield(passwordController, "Password", Icons.shopping_bag_rounded ,true ),
              Align(alignment: Alignment.topRight, child: UiHelper.customtextbutton((){},'Forgot Password ?',12.sp, false ),),
              UiHelper.customElevetedButton((){}, " Login"),
              SizedBox(height: 30.h,),
              Text(" - OR Continue with -"),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UiHelper.CustomIconButton((){}, Image.asset('assets/google_logo.png')),
                    UiHelper.CustomIconButton((){}, Image.asset('assets/apple_logo.png')),
                    UiHelper.CustomIconButton((){}, Image.asset('assets/facebook_logo.png')),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" Create An Account"),
                  UiHelper.customtextbutton((){}, 'Sign Up ',18.sp, true)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
