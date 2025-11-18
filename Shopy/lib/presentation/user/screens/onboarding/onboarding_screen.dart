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
    final size = MediaQuery.of(context).size;

    return [
      PageViewModel(
        decoration: pageDecoration(),
        image: Image.asset(
          'assets/choose_your_product.png',
          height: size.height * 0.35,
        ),
        titleWidget: pageTitle("Choose Your Product", size),
        bodyWidget: pageBody(
          "Quickly find your favourite items from thousands of trendy, high-quality products.",
          size,
        ),
      ),

      PageViewModel(
        decoration: pageDecoration(),
        image: Image.asset(
          'assets/make_payment.png',
          height: size.height * 0.35,
        ),
        titleWidget: pageTitle("Make Payment", size),
        bodyWidget: pageBody(
          "Experience fast, simple and secure checkout with multiple payment options.",
          size,
        ),
      ),

      PageViewModel(
        decoration: pageDecoration(),
        image: Image.asset(
          'assets/get_your_order.png',
          height: size.height * 0.35,
        ),
        titleWidget: pageTitle("Get Your Order", size),
        bodyWidget: pageBody(
          "Enjoy quick delivery right to your doorstep with real-time tracking.",
          size,
        ),
      ),
    ];
  }

  Widget pageTitle(String text, Size size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.width * 0.075,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
        letterSpacing: 0.5,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget pageBody(String text, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black54,
          fontSize: size.width * 0.045,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  PageDecoration pageDecoration() {
    return PageDecoration(
      imageFlex: 2,
      titlePadding: const EdgeInsets.only(top: 20),
      bodyPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,

        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.w600),
        ),
        next: const Icon(Icons.arrow_forward_rounded, color: Colors.pinkAccent),
        done: Text(
          "Get Started",
          style: TextStyle(
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.045,
          ),
        ),

        dotsDecorator: DotsDecorator(
          activeColor: Colors.pinkAccent,
          color: Colors.pinkAccent.withOpacity(0.3),
          size: const Size(10, 10),
          activeSize: const Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
