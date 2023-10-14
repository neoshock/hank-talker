import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF4FA53A),
    secondaryHeaderColor: const Color(0xFFD29335),
    cardTheme: const CardTheme(color: Colors.white, elevation: 3),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF1F5F9),
      foregroundColor: Color.fromRGBO(44, 44, 44, 1),
      elevation: 0,
    ),
    scaffoldBackgroundColor:
        const Color(0xFFF1F5F9), // light grey, used for background
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4FA53A),
      secondary: Color(0xFFD29335),
      background: Color(0xFFF1F5F9),
      error: Color(0XFFFF2442),
      tertiary: Color(0xFFFACE33),
      primaryContainer: Color(0xFF689F38),
      secondaryContainer: Color(0xFFD29335),
      inversePrimary: Color(0xFF1B7505),
      inverseSurface: Color(0xFFD29335),
      onPrimary: Color(0xFFF1F5F9),
      onSecondary: Color.fromARGB(255, 108, 122, 122),
      surface: Color(0xFFF9F9F9), // Utilizado para la superficie
    ),
    // Define other theme properties such as textTheme, appBarTheme, etc.
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      displayMedium: TextStyle(
          fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),
      displaySmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      bodyMedium: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color(0xFF4FA53A),
    secondaryHeaderColor: const Color(0xFFD29335),
    cardTheme: const CardTheme(color: Color(0xff1E293B), elevation: 3),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff131B31),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    scaffoldBackgroundColor:
        const Color(0xff1E293B), // fondo negro para el modo oscuro
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF4FA53A),
      secondary: Color(0xFFD29335),
      background: Color(0xff1E293B),
      error: Color(0XFFFF2442),
      tertiary: Color(0xFFFACE33),
      primaryContainer: Color(0xFF689F38),
      secondaryContainer: Color(0xFFD29335),
      inversePrimary: Color(0xFF1B7505),
      inverseSurface: Color(0xFFD29335),
      onPrimary: Color(0xff1E293B),
      onSecondary: Colors.white,
      surface: Color(0xff262D3F),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(
          fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
      displaySmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
      bodyMedium: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
    ),
  );
}
