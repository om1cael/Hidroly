import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.blueAccent,
      colorScheme: ColorScheme.dark(
        primary: AppColors.blueAccent,
        surface: AppColors.background,
        onSurface: AppColors.onBackground,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        titleTextStyle: TextStyle(
          color: AppColors.primaryText,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColors.primaryText),
        bodyMedium: TextStyle(
          color: AppColors.secondaryText,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
          color: AppColors.secondaryText,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
        headlineLarge: TextStyle(
          color: AppColors.primaryText, 
          fontSize: 40,
          fontWeight: FontWeight.bold
        ),
        titleLarge: TextStyle(
          color: AppColors.primaryText,
          fontSize: 24,
        ),
      ),
      iconTheme: IconThemeData(color: AppColors.icon),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
        )
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.onBackground,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        counterStyle: TextStyle(
          color: AppColors.secondaryText,
          fontSize: 12,
        )
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryText,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.onBackground,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.unselectedItem,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.onBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      fontFamily: 'Poppins',
    );
  }
}
