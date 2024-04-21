import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    hintColor: Colors.purple[300],
    scaffoldBackgroundColor: Colors.grey[100],
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF52A0FF),
      secondary: Color(0xFF006AF5),
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF52A0FF)
    )
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    hintColor: Colors.purple[300],
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF52A0FF),
      secondary: Color(0xFF006AF5),
    ),
  );
}