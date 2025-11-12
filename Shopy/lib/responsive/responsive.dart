import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Container"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get available width and height
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          // Define breakpoints (you can adjust these as needed)
          double fontSize;
          double padding;
          double containerWidth;

          if (screenWidth < 400) {
            // Small devices
            fontSize = 14;
            padding = 8;
            containerWidth = screenWidth * 0.9;
          } else if (screenWidth < 800) {
            // Medium devices (tablets)
            fontSize = 18;
            padding = 16;
            containerWidth = screenWidth * 0.8;
          } else {
            // Large devices (desktops)
            fontSize = 22;
            padding = 24;
            containerWidth = screenWidth * 0.6;
          }

          return Center(
            child: Container(
              width: containerWidth,
              padding: EdgeInsets.all(padding),
              color: Colors.indigoAccent,
              child: Text(
                "Responsive Text Example",
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
