import 'package:flutter/material.dart';
import 'package:pick_and_pay/Screens/first_page.dart';

import 'Screens/Searchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Pick&Pay - Ecommerce App ',
debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstpage': (context)=> FirstPage(),
        '/Searchpage':(context)=> Searchpage(),
      },
    );
  }
}
