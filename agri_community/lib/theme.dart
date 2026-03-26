import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF3A7D44);       // Deep forest green
  static const Color primaryLight = Color(0xFF6BAF7A);  // Soft green
  static const Color primaryDark = Color(0xFF275C30);   // Dark green
  static const Color accent = Color(0xFFE8A838);        // Warm amber
  static const Color background = Color(0xFFF7F4EF);    // Warm beige
  static const Color surface = Color(0xFFFFFFFF);       // White
  static const Color cardBg = Color(0xFFFBF9F5);        // Light warm white
  static const Color textPrimary = Color(0xFF1C2B1E);   // Near black green
  static const Color textSecondary = Color(0xFF6B7C6E); // Muted green-grey
  static const Color divider = Color(0xFFE4DDD4);       // Warm divider
  static const Color tagBg = Color(0xFFE8F5EB);         // Light green tag bg
  static const Color tagText = Color(0xFF2E6B38);       // Dark tag text
  static const Color errorRed = Color(0xFFD95B5B);      // Soft red
  static const Color warningYellow = Color(0xFFF0C040); // Warning yellow
}

class AppTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.accent,
          background: AppColors.background,
          surface: AppColors.surface,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          scrolledUnderElevation: 1,
          shadowColor: Color(0x18000000),
          titleTextStyle: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            letterSpacing: 0.2,
          ),
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: AppColors.cardBg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.divider, width: 1),
          ),
          margin: EdgeInsets.zero,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 1.5),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.divider),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.divider),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          labelStyle: const TextStyle(color: AppColors.textSecondary),
          hintStyle:
              const TextStyle(color: AppColors.textSecondary, fontSize: 14),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        fontFamily: 'sans-serif',
      );
}