import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = const TextTheme(
    headlineLarge: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),
    headlineMedium: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),
    headlineSmall:  TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),

    titleLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.black),
    titleMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),
    titleSmall: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),

    bodyLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.black),
    bodyMedium: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),
    bodySmall: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),

    labelLarge: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),
    labelMedium: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),

  );
  static TextTheme darkTexttheme = const TextTheme(
    headlineLarge: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white),
    headlineMedium: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),
    headlineSmall:  TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),

    titleLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
    titleMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
    titleSmall: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),

    bodyLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),
    bodyMedium: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white),
    bodySmall: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),

    labelLarge: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white),
    labelMedium: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white),


  );


}