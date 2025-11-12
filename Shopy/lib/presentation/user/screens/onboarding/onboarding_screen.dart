import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shopy/auth/loginpage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<PageViewModel> getPages(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return [
      PageViewModel(
        decoration: const PageDecoration(imageFlex: 2),
        image: Image.asset(
          'assets/choose_your_product.png',
          height: height * 0.35,
        ),
        titleWidget: Text(
          "Choose your product",
          style: TextStyle(fontSize: width * 0.065, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        body:
        "Find and choose your favorite products easily. See many good items, compare them, and shop quickly for a smooth and happy experience.",
      ),
      PageViewModel(
        decoration: const PageDecoration(imageFlex: 2),
        image: Image.asset(
          'assets/make_payment.png',
          height: height * 0.35,
        ),
        titleWidget: Text(
          "Make Payment",
          style: TextStyle(fontSize: width * 0.065, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        body:
        "Pay safely and quickly for your products. Choose how you want to pay and finish your order in seconds.",
      ),
      PageViewModel(
        decoration: const PageDecoration(imageFlex: 2),
        image: Image.asset(
          'assets/get_your_order.png',
          height: height * 0.35,
        ),
        titleWidget: Text(
          "Get Your Order",
          style: TextStyle(fontSize: width * 0.065, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        body:
        "Your order will be delivered quickly. Enjoy your products right at your doorstep.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(color: Colors.pinkAccent),
        ),
        next: const Icon(Icons.arrow_forward_rounded, color: Colors.pinkAccent),
        done: const Text(
          "Get Started",
          style: TextStyle(color: Colors.blue),
        ),
        dotsDecorator: const DotsDecorator(
          color: Colors.pinkAccent,
        ),
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Loginpage()),
          );
        },
        pages: getPages(context),
      ),
    );
  }
}
