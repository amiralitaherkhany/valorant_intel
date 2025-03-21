import 'package:flutter/material.dart';

class AppColors {
  //primary colors
  ///////////////////////////////////////////////////////
  static const Color mainRed = Color(0xFFFF4655); //valorant red color
  static const Color scaffoldBackground =
      Color(0xFF1C1C1C); //main background color
  static const Color cardBackground = Color(
      0xFF2A2A2A); //As a background for cards and various elements on pages.

  //secondary colors
  ////////////////////////////////////////////////////////
  static const Color white = Color(
      0xFFEAEAEA); //Used for texts, edges and sub-icons to increase readability.
  static const Color grey = Color(
      0xFFB0B0B0); //For explanatory texts and secondary content that need less emphasis.
  static const Color darkBlue = Color(
      0xFF002F4E); //For interactive parts such as buttons and links, as well as to balance with red color.

  //Accent Colors
  ////////////////////////////////////////////////////////
  static const Color yellow = Color(
      0xFFFFC107); //For alert notifications, important messages and warnings.
  static const Color green = Color(
      0xFF4CAF50); //To display positive statuses, such as victories or achievements in the stats section.

  static const darkColorScheme = ColorScheme.dark(
    primary: AppColors.mainRed,
    secondary: AppColors.darkBlue,
    surface: AppColors.cardBackground,
    error: Colors.red,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onSurface: AppColors.white,
    onError: AppColors.white,
  );

  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.mainRed,
    secondary: AppColors.darkBlue,
    surface: AppColors.grey,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: AppColors.white,
    onSurface: AppColors.cardBackground,
    onError: AppColors.white,
  );
}
