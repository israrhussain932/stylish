import  'package:flutter/material.dart';
import '../../../constants/sizes.dart';
class AppbarTheme {
  AppbarTheme._();

  //LIGHT APPBAR THEME

  static var LightAppBarTheme = const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black,size: Sizes.iconmd),
      actionsIconTheme: IconThemeData(color: Colors.black,size: Sizes.iconmd),
      titleTextStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,color: Colors.black)
  );

  //DARK APPBAR THEME
  static const DarkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black,size: 24),
      actionsIconTheme: IconThemeData(color: Colors.white,size: 24),
      titleTextStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,color: Colors.white)
  );

}