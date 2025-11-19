import 'package:flutter/material.dart';

class UiHelper {

  static Widget customTextField(
      TextEditingController controller, String text, IconData iconData, bool toHide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
  static Widget customElevatedButton(
      BuildContext context, VoidCallback voidCallback, String text) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height * 0.07,
        width: width * 0.8,
        child: ElevatedButton(
          onPressed: voidCallback,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.pinkAccent.shade200,
            textStyle: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }

  static Widget customTextButton(
      VoidCallback voidCallback, String text, double fontSize, bool underline) {
    return TextButton(
      onPressed: voidCallback,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.pinkAccent,
          fontSize: fontSize,
          decoration:
          underline ? TextDecoration.underline : TextDecoration.none,
          decorationThickness: 2,
          decorationColor: Colors.pinkAccent,
        ),
      ),
    );
  }

  static Widget customIconButton(VoidCallback voidCallback, Widget image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: voidCallback,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
            border: Border.all(color: Colors.pinkAccent, width: 2),
          ),
          child: Center(
            child: SizedBox(
              height: 24,
              width: 24,
              child: image,
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> customAlertBox(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}