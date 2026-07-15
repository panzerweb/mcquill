import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
  DEFINED THE TEXT STYLES

  To use with colors do this

  style: AppTextStyles.displayLarge.copyWith(color: Colors.white)
*/

class AppTextStyles {
  AppTextStyles._();

  // ===========================
  // Display
  // ===========================

  static TextStyle displayLarge = GoogleFonts.vt323(
    textStyle: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      height: 1.2,
    ),
  );

  static TextStyle displayMedium = GoogleFonts.vt323(
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      height: 1.2,
    ),
  );

  static TextStyle displaySmall = GoogleFonts.vt323(
    textStyle: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      height: 1.2,
    ),
  );

  // ===========================
  // Headlines
  // ===========================

  static TextStyle screenHeading = GoogleFonts.vt323(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.3,
    ),
  );

  static TextStyle sectionHeading = GoogleFonts.vt323(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 1.3,
    ),
  );

  static TextStyle cardHeading = GoogleFonts.vt323(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 1.3,
    ),
  );

  // ===========================
  // Titles
  // ===========================

  static TextStyle titleLarge = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
  );

  static TextStyle titleMedium = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
  );

  static TextStyle titleSmall = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
  );

  // ===========================
  // Body
  // ===========================

  static TextStyle bodyLarge = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  );

  static TextStyle bodyMedium = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  );

  static TextStyle bodySmall = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  );

  // ===========================
  // Labels
  // ===========================

  static TextStyle labelLarge = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
  );

  static TextStyle labelMedium = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.3,
    ),
  );

  static TextStyle labelSmall = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.3,
    ),
  );

  // ===========================
  // Utility
  // ===========================

  static TextStyle caption = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      height: 1.4,
    ),
  );

  static TextStyle overline = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
      height: 1.4,
    ),
  );

  static TextStyle button = GoogleFonts.spaceGrotesk(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
  );
}
