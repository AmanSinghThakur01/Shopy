import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
class onboardingscreen extends StatefulWidget {
  const onboardingscreen({super.key});

  @override
  State<onboardingscreen> createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  getpages(){
    return [
      PageViewModel(
        decoration: PageDecoration(imageFlex: 2,),
        image: Image.asset('choose_your_product.png')   ,
      titleWidget: Text("Choose your product",style: TextStyle(fontSize: 25.sp),),
      body: "Find and choose your favorite products easily. See many good items, compare them, and shop quickly for a smooth and happy experience."),
      PageViewModel(
          decoration: PageDecoration(imageFlex: 2,),
          image: Image.asset('make_payment.png')   ,
          titleWidget: Text("Make Payment",style: TextStyle(fontSize: 25.sp),),
          body: "Pay safely and quickly for your products. Choose how you want to pay and finish your order in seconds."),
      PageViewModel(
          decoration: PageDecoration(imageFlex: 2,),
          image: Image.asset('get_your_order.png')   ,
          titleWidget: Text("Get Your Order "),
          body: "Your order will be delivered quickly Enjoy your products right at your doorstep."),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showSkipButton: true,
        skip: Text("Skip",style: TextStyle(color: Colors.pinkAccent),),
        next: Icon(Icons.arrow_forward_rounded,color: Colors.pinkAccent,),
        done: Text("Get Started",style: TextStyle(color: Colors.blue),),
        dotsDecorator: DotsDecorator(
          color: Colors.pinkAccent,
          
        ),
        onDone: (){print("start Application");},
        pages:getpages (),
      ),
    );
  }
}
