import 'package:flutter/material.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
          backgroundColor: Colors.pink.shade50,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Setting ",
            style: TextStyle(
              fontSize: 24,
              color: Colors.pink,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),

       ),
      body: Text("Setting Screen"),
    );
  }
}
