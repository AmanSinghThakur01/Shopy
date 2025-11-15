import 'package:flutter/material.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopy || Your Order's",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.pink.shade200),),
      ),
      body: Center(
        child: Text(" No order yet ! ." , style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
      ),
    );
  
  }
}
