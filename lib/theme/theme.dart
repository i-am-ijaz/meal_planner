import 'package:flutter/material.dart';
import 'package:meal_planner/theme/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
    ),
    useMaterial3: true,
  );
}
