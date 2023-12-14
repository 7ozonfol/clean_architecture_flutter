import 'package:flutter/material.dart';
import '../Theme/colors.dart';

/// appTheme holds the app theme color if the app contains more than on theme we should create one for each theme color
final appTheme = ThemeData(
  primaryColor: AppColors.background,
  primarySwatch: Colors.grey,
  scaffoldBackgroundColor: AppColors.background,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.headersTextColor,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      color: AppColors.headersTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: AppColors.bodyText,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),
);
