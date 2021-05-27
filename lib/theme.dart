import 'package:flutter/material.dart';

final theme = ThemeData(
  dividerColor: Colors.transparent,
  primaryColor: Color(0xFF8FB339),
  accentColor: Color(0xFF4B5842),
  hintColor: Color(0xFFD16014),
  backgroundColor: Color(0xFFDADDD8),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Color(0xFF8FB339)
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Color(0xFF4B5842)
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white
  )
);