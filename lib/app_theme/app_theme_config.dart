import 'package:flutter/material.dart';
import 'package:flutter_template/app_theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeConfig {
  final Color primaryColor;
  final Color secondaryColor;
  final Color onSecondaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Brightness brightness;

  AppThemeConfig.light()
      : primaryColor = LightThemeColors.primaryColor,
        secondaryColor = LightThemeColors.secondaryColor,
        onSecondaryColor = LightThemeColors.onSecondaryColor,
        primaryTextColor = LightThemeColors.primaryTextColor,
        secondaryTextColor = LightThemeColors.secondaryTextColor,
        surfaceColor = LightThemeColors.surfaceColor,
        backgroundColor = LightThemeColors.backgroundColor,
        brightness = Brightness.light;

  AppThemeConfig.dark()
      : primaryColor = DarkThemeColors.primaryColor,
        secondaryColor = DarkThemeColors.secondaryColor,
        onSecondaryColor = DarkThemeColors.onSecondaryColor,
        primaryTextColor = DarkThemeColors.primaryTextColor,
        secondaryTextColor = DarkThemeColors.secondaryTextColor,
        surfaceColor = DarkThemeColors.surfaceColor,
        backgroundColor = DarkThemeColors.backgroundColor,
        brightness = Brightness.dark;

  ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        brightness: brightness,
        primary: primaryColor,
        secondary: secondaryColor,
        onSecondary: onSecondaryColor,
        surface: surfaceColor,
        background: backgroundColor,
      ),
      dividerColor: surfaceColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        filled: true,
        fillColor: surfaceColor,
      ),
      textTheme: enPrimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(
        TextTheme(
          bodyText2: TextStyle(
            fontSize: 15,
            color: primaryTextColor,
          ),
          bodyText1: TextStyle(
            fontSize: 13,
            color: secondaryTextColor,
          ),
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
        ),
      );
}
