import 'package:flutter/material.dart';
import 'package:shopy/widgets/app_appbar.dart';
class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("CartScareen")
          ],
        ),
      ),
    );
  }
}