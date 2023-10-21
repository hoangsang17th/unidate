// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:unidate/core/values/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle h1 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle h2 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle h3 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle h4 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle h5 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle h6 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle subtitle1 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle subtitle2 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle body1 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle body2 = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle caption = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
  );

  static TextStyle overline = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.5,
      color: AppColors.textPrimary,
    ),
  );
}
