import 'package:flutter/material.dart';
import 'package:litterflow_app/constants/colors.dart';

class Themes {
  static final ThemeData kLightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kWhiteColor,
    ),
    scaffoldBackgroundColor: AppColors.kTertiaryColor,
    primaryColor: AppColors.kPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimaryColor,
      onPrimary: AppColors.kWhiteColor,
      secondary: AppColors.kSecondaryColor,
      onSecondary: AppColors.kWhiteColor,
      background: AppColors.kTertiaryColor,
      onBackground: AppColors.kDarkColor,
      brightness: Brightness.light,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.kWhiteColor,
      elevation: 0,
      unselectedItemColor: AppColors.kSecondaryColor,
      selectedItemColor: AppColors.kPrimaryColor,
      type: BottomNavigationBarType.fixed,
    ),
    fontFamily: 'Montserrat',
  );


}
