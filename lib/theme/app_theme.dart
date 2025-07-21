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
        outlineVariant: Colors.transparent,
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
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.background,
        headerBackgroundColor: AppColors.onBackground,
        headerForegroundColor: AppColors.secondaryText,

        weekdayStyle: TextStyle(
          color: AppColors.secondaryText,
        ),

        dividerColor: Colors.transparent,
      
        yearForegroundColor: WidgetStateProperty.resolveWith<Color>((state) {
          if(state.contains(WidgetState.disabled)) {
            return AppColors.unselectedItem;
          } else {
            return AppColors.primaryText;
          }
        }),

        dayForegroundColor: WidgetStateProperty.resolveWith<Color>((state) {
          if(state.contains(WidgetState.disabled)) {
            return AppColors.unselectedItem;
          } else if(state.contains(WidgetState.selected)) {
            return AppColors.onBackground;
          } else {
            return AppColors.secondaryText;
          }
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((state) {
          if(state.contains(WidgetState.selected)) {
            return AppColors.blueAccent;
          }
          return Colors.white;
        }),
      ),
      fontFamily: 'Poppins',
    );
  }
}
