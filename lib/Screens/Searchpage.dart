import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';


import '../services/Api_services.dart';
class Searchpage extends StatefulWidget {
  const Searchpage({super.key});
  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search ....',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" hy"),

          ],
        ),
      ), // Search results
    );
  }
}