import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF1B7505),
    secondaryHeaderColor: const Color(0xFFD29335),
    cardTheme: const CardTheme(color: Colors.white, elevation: 3),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF1F5F9),
      foregroundColor: Color.fromRGBO(44, 44, 44, 1),
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1B7505),
      secondary: Color(0xFFD29335),
      background: Color(0xFFF1F5F9),
      error: Color(0XFFFF2442),
      tertiary: Color(0xFFFACE33),
      primaryContainer: Color(0xFF689F38), // green, used for avatar bg
      secondaryContainer: Color(0xFFD29335), // orange, used for avatar bg
      inversePrimary: Color(0xFF1B7505), // green, used for appbar bg
      inverseSurface:
          Color(0xFFD29335), // orange, used for appbar bg and button bg
      surface:
          Color.fromARGB(255, 255, 255, 255), // light grey, used for background
      onPrimary: Color(0xFFF1F5F9), // light grey, used for text on green
      onSecondary: Color.fromARGB(
          255, 108, 122, 122), // light grey, used for text on orange
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

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF1B7505),
    secondaryHeaderColor: const Color(0xFFD29335),
    cardTheme: const CardTheme(color: Colors.black, elevation: 3),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF303030),
      foregroundColor: Color(0xFF303030),
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1B7505),
      secondary: Color(0xFFD29335),
      error: Color(0XFFFF2442),
      tertiary: Color(0xFFFACE33),
      primaryContainer: Color(0xFF689F38), // green, used for avatar bg
      secondaryContainer: Color(0xFFD29335), // orange, used for avatar bg
      inversePrimary: Color(0xFF1B7505), // green, used for appbar bg
      inverseSurface:
          Color(0xFFD29335), // orange, used for appbar bg and button bg
      surface: Color(0xFF303030), // dark grey, used for background
      onPrimary: Color(0xFFF1F5F9), // light grey, used for text on green
    ),
    // Define other theme properties such as textTheme, appBarTheme, etc.
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

  static ThemeData blueVariantTheme = ThemeData(
    primaryColor: const Color(0xFF1976D2), // Blue primary color
    secondaryHeaderColor: const Color(0xFF388E3C), // Green secondary color
    cardTheme: const CardTheme(color: Colors.white, elevation: 3),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF1F5F9),
      foregroundColor: Color(0xFFF1F5F9),
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1976D2),
      secondary: Color(0xFF388E3C),
      background: Color(0xFFF1F5F9),
      error: Color(0XFFFF2442),
      tertiary: Color(0xFFFACE33),
      primaryContainer: Color(0xFF689F38), // Green, used for avatar bg
      secondaryContainer: Color(0xFFD29335), // Orange, used for avatar bg
      inversePrimary: Color(0xFF1976D2), // Blue, used for appbar bg
      inverseSurface:
          Color(0xFFD29335), // Orange, used for appbar bg and button bg
      surface: Color(0xFFF1F5F9), // Light grey, used for background
      onPrimary: Color(0xFFF1F5F9), // Light grey, used for text on blue
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
}
