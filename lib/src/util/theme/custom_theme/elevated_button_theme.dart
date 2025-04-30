import 'package:flutter/material.dart';

// -- light and dark elevated button theme
class ElevatedButtonTheme {
  ElevatedButtonTheme._();

  //light theme
  static final lightTelevatedButtonTheme =  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFF83758),
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(
          color: Color(0xFFF83758)
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      )
  );
// DARK THEME
  static final darkelevatedButtonTheme =  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFF83758),
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: Color(0xFFF83758)),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      )

  );
}