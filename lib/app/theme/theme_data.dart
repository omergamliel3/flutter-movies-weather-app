import 'package:flutter/material.dart';

// Light theme data
ThemeData lightThemeData() {
  return ThemeData.light().copyWith(
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none));
}

// Dark theme data
ThemeData darkThemeData() {
  return ThemeData.dark().copyWith(
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none));
}
