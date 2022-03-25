import 'package:flutter/material.dart';

ThemeData AppThemeData() {
  return ThemeData(
    primaryColor: Colors.deepPurple[900],
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple[900],
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple[900]),
      ),
    ),
  );
}
