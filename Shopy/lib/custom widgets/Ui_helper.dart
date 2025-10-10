import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UiHelper {
  static customtextfield (TextEditingController controller, String text, IconData icondata,bool tohide){
    return Padding(
      padding: const EdgeInsets.only(right: 12,bottom: 1,left: 12,top: 20,),
      child: TextField(
      controller: controller,
        obscureText: tohide,
        decoration: InputDecoration(
          hintText: text,
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: Icon(icondata),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

          ),
        ),

      ),
    );
  }

  static customElevetedButton( voidcallback , text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(height: 50.h, width: 300.w, child: ElevatedButton(onPressed: (){voidcallback();}, child: Text(text) ,style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), foregroundColor: Colors.white, backgroundColor: Colors.pinkAccent.shade200,textStyle: TextStyle( fontSize: 25.sp,fontWeight: FontWeight.bold,)),)),
    );
  }

  // Custom TextButton
  static customtextbutton(voidcallback, String text, double fontsize, bool underline) {
    return TextButton(
      onPressed: () {
        voidcallback();
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.pinkAccent,
          fontSize: fontsize,
          decoration: underline ? TextDecoration.underline : TextDecoration.none,
          decorationThickness: 2,
          decorationColor: Colors.pinkAccent,
        ),
      ),
    );
  }
static CustomIconButton(voidcallback , image){
return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    //height: 35.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
        border: Border.all(color: Colors.pinkAccent,),
      ),
      child: IconButton(onPressed: (){voidcallback();}, icon: image,)),
);
}

}