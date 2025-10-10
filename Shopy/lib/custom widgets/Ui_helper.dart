import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class UiHelper {
  static customtextfield (TextEditingController controller, String text, IconData, bool tohide){
    return TextField(
controller: controller,
      obscureText: tohide,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: IconData,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10);
        )
      ),

    );
  }

  static customTextButton( voidcallback , text){
    return TextButton(onPressed: voidcallback, child: text, style: ButtonStyle( color: Colors.white),)
  }

}