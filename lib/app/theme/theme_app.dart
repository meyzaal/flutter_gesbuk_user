import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';

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
      scaffoldBackgroundColor: AppColors.backgroundLight,
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 1.0,
        backgroundColor: AppColors.backgroundLight,
        shadowColor: Colors.black38,
        foregroundColor: AppColors.black,
      ),
      textTheme: theme.textTheme.apply(fontFamily: 'Nunito'),
    );
  }
}
