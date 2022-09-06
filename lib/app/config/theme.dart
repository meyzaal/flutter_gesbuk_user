import 'package:flutter/material.dart';

class AppSizes {
  static const double sidePadding = 16.0;
  static const double widgetSidePadding = 8.0;
  static const double buttonRadius = 16;
  static const double imageRadius = 8.0;
  static const double linePadding = 4.0;
  static const double widgetBorderRadius = 16.0;
  static const double textFieldRadius = 8.0;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
}

class AppColors {
  static const mainColor = Color(0xFF00ADF1);
  static const secondaryColor = Color(0xFF0095D9);
  static const lightBlue = Color(0xFF8DD8F7);
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
}

class GesbukUserTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      colorScheme:
          ThemeData().colorScheme.copyWith(primary: AppColors.mainColor),
      primaryColor: AppColors.mainColor,
      primaryColorLight: AppColors.lightBlue,
      backgroundColor: AppColors.background,
      dialogBackgroundColor: AppColors.backgroundLight,
      errorColor: AppColors.red,
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 4.0,
        backgroundColor: AppColors.white,
        shadowColor: Colors.black12,
        foregroundColor: AppColors.black,
      ),
      textTheme: theme.textTheme.apply(fontFamily: 'Nunito'),
    );
  }
}
