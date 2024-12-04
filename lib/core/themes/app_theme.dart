import 'package:bmi_calculator/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
    ),
    scaffoldBackgroundColor: AppColor.secondaryColor,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColor.buttonColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ))),
    ),
  );
}
