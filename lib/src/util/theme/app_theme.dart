import 'package:flutter/material.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';

class AppTheme {
  static var dark;
  AppTheme._();

  // Light Theme
  static ThemeData LightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "poopins",
    brightness: Brightness.light,
    primaryColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppbarTheme.LightAppBarTheme,

    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: const ElevatedButtonThemeData(),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "poopins",
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    textTheme: TTextTheme.darkTexttheme,  // Custom dark text theme
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppbarTheme.DarkAppBarTheme,  // Custom dark app bar theme
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,  // Custom dark text field theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey, // Dark button background
      ),
    ),
  );
}
