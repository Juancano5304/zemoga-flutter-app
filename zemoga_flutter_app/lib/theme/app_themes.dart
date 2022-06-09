import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = _themeData(_lightColorScheme);

  static ThemeData _themeData(ColorScheme colorScheme) {
    return ThemeData(
      primarySwatch: Colors.green,
      appBarTheme: const AppBarTheme(
        color: Colors.green,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme.light(
    background: Colors.white,
    brightness: Brightness.light,
    error: Colors.red,
    onBackground: Colors.white,
    onError: Colors.black,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    primary: Colors.green,
    primaryContainer: Color(0xFF253A2C),
    secondary: Color(0xFFEFF3F3),
    secondaryContainer: Color(0xFF607162),
    surface: Color(0xFFFAFBFB),
  );
}
