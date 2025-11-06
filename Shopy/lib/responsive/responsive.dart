import 'package:flutter/material.dart';
    class Responsive extends StatefulWidget {
      const Responsive({super.key});

      @override
      State<Responsive> createState() => _ResponsiveState();
    }

    class _ResponsiveState extends State<Responsive> {
      @override
      Widget build(BuildContext context) {
        //Get screen width and height
        final screenWidth = MediaQuery.of(context).size.width ;
        final screenHeight = MediaQuery.of(context).size.height ;

        //example scaling logic
        double fontSize = screenWidth * 0.05;
        double padding = screenWidth * 0.04 ;
        double containerWidth = screenWidth *0.8;

        return Scaffold(
          appBar: AppBar(
            title: Text("appbar responsive container"),
          ),
          body: Center(
            child: Container(
              width: containerWidth,
              padding: EdgeInsets.all(padding),
              color: Colors.indigoAccent,
              child: Text(" Responsive Text Example ",
              style: TextStyle(fontSize: fontSize),
                textAlign: TextAlign.center,
              ),

            ),
          ),
        );
      }
    }
