import 'package:flutter/material.dart';
class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Shopy",
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 22
              ,
              fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.person),
        ],
      ),
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

