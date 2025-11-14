import 'package:flutter/material.dart';
class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Shopy",
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: Text("search Page"),
    );
  }
}