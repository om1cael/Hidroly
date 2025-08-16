import 'package:flutter/material.dart';
import 'package:hidroly/theme/app_colors.dart';

class LightTheme {
  static ThemeData get data {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColorsLight.background,
      primaryColor: AppColorsLight.blueAccent,
      colorScheme: ColorScheme.light(
        primary: AppColorsLight.blueAccent,
        surface: AppColorsLight.background,
        onSurface: AppColorsLight.onBackground,
        outlineVariant: Colors.transparent,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorsLight.background,
        titleTextStyle: TextStyle(
          color: AppColorsLight.primaryText,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColorsLight.primaryText),
        bodyMedium: TextStyle(
          color: AppColorsLight.secondaryText,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
          color: AppColorsLight.secondaryText,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
        headlineLarge: TextStyle(
          color: AppColorsLight.primaryText, 
          fontSize: 40,
          fontWeight: FontWeight.bold
        ),
        titleLarge: TextStyle(
          color: AppColorsLight.primaryText,
          fontSize: 24,
        ),
        labelLarge: TextStyle(
          color: AppColorsLight.primaryText,
          fontSize: 14,
        ),
        labelMedium: TextStyle(
          color: AppColorsLight.secondaryText,
          fontSize: 13,
        ),
      ),
      iconTheme: IconThemeData(color: AppColorsLight.primaryText),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColorsLight.onBackground,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        counterStyle: TextStyle(
          color: AppColorsLight.secondaryText,
          fontSize: 12,
        )
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColorsLight.primaryText,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColorsLight.onBackground,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColorsLight.unselectedItem,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsLight.onBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColorsLight.background,
        headerBackgroundColor: AppColorsLight.onBackground,
        headerForegroundColor: AppColorsLight.secondaryText,

        weekdayStyle: TextStyle(
          color: AppColorsLight.secondaryText,
        ),

        dividerColor: Colors.transparent,
      
        yearForegroundColor: WidgetStateProperty.resolveWith<Color>((state) {
          if(state.contains(WidgetState.disabled)) {
            return AppColorsLight.unselectedItem;
          } else {
            return AppColorsLight.primaryText;
          }
        }),

        dayForegroundColor: WidgetStateProperty.resolveWith<Color>((state) {
          if(state.contains(WidgetState.disabled)) {
            return AppColorsLight.unselectedItem;
          } else if(state.contains(WidgetState.selected)) {
            return AppColorsLight.onBackground;
          } else {
            return AppColorsLight.secondaryText;
          }
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((state) {
          if(state.contains(WidgetState.selected)) {
            return AppColorsLight.blueAccent;
          }
          return AppColorsLight.unselectedItem;
        }),
      ),
      timePickerTheme: TimePickerThemeData(
        hourMinuteTextColor: AppColorsLight.primaryText,
        entryModeIconColor: AppColorsLight.primaryText,
        dialBackgroundColor: AppColorsLight.onBackground,
        dialTextColor: AppColorsLight.primaryText
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        contentTextStyle: TextStyle(
          color: AppColorsLight.primaryText,
          fontSize: 16,
        ),
        closeIconColor: Colors.redAccent,
        showCloseIcon: true,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((state) {
          if(state.contains(WidgetState.selected)) {
            return AppColorsLight.blueAccent;
          }

          return Colors.transparent;
        }),
        side: BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        )
      ),
      listTileTheme: ListTileThemeData(
        iconColor: AppColorsLight.primaryText,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColorsLight.onBackground,
        foregroundColor: AppColorsLight.primaryText,
      ),
      fontFamily: 'Poppins',
    );
  }
}