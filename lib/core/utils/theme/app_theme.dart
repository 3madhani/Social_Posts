import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.lightCardColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.lightTextColor,
    ),
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white, // For text and icons
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 14,
      ),
      headlineSmall: TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white, // Text color
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.darkCardColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.darkTextColor,
    ),
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 14,
      ),
      headlineSmall: TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
  );
}
