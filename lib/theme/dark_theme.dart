import 'package:flutter/material.dart';
import 'package:hidroly/theme/app_colors.dart';

class DarkTheme {
  static ThemeData get data {
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
        labelLarge: TextStyle(
          color: AppColors.primaryText,
          fontSize: 14,
        ),
        labelMedium: TextStyle(
          color: AppColors.secondaryText,
          fontSize: 12,
        ),
      ),
      iconTheme: IconThemeData(color: AppColors.primaryText),
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
      timePickerTheme: TimePickerThemeData(
        hourMinuteTextColor: AppColors.primaryText,
        entryModeIconColor: AppColors.primaryText,
        dialBackgroundColor: AppColors.onBackground,
        dialTextColor: AppColors.primaryText
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        contentTextStyle: TextStyle(
          fontSize: 16,
        ),
        closeIconColor: Colors.redAccent,
        showCloseIcon: true,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((state) {
          if(state.contains(WidgetState.selected)) {
            return AppColors.blueAccent;
          }

          return Colors.transparent;
        }),
        side: BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        )
      ),
      listTileTheme: ListTileThemeData(
        iconColor: AppColors.primaryText,
      ),
      fontFamily: 'Poppins',
    );
  }
}