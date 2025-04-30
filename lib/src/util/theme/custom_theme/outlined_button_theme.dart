import 'package:flutter/material.dart';

class OutlinedButtonTheme {
  OutlinedButtonTheme._();


  //for light theme--*
  static final  LightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Color(0xFFF83758)),
        textStyle: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      )
  );
  //  FOR DARK THEME -_*
  static final  DarkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        side: const BorderSide(color: Color(0xFFF83758)),
        textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      )
  );

}