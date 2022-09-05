import 'package:flutter/material.dart';

class AppSizes {
  static const double sidePadding = 16.0;
  static const double widgetSidePadding = 8.0;
  static const double buttonRadius = 16;
  static const double imageRadius = 8.0;
  static const double linePadding = 4.0;
  static const double widgetBorderRadius = 24.0;
  static const double textFieldRadius = 8.0;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
}

class AppColors {
  static const mainColor = Color(0xFF0095D9);
  static const secondaryColor = Color(0xFF00ADF1);
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

class OpenFlutterEcommerceTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.mainColor,
      primaryColorLight: AppColors.lightBlue,
      backgroundColor: AppColors.background,
      dialogBackgroundColor: AppColors.backgroundLight,
      errorColor: AppColors.red,
      appBarTheme: theme.appBarTheme.copyWith(
          color: AppColors.white,
          iconTheme: const IconThemeData(color: AppColors.black),
          titleTextStyle: theme.appBarTheme.titleTextStyle
              ?.copyWith(color: AppColors.black, fontFamily: 'Nunito')),
      // textTheme: theme.textTheme
      //     .copyWith(
      //       //over image white text
      //       headline5: theme.textTheme.headline5.copyWith(
      //         fontSize: 48,
      //         color: AppColors.white,
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w900,
      //       ),
      //       headline6: theme.textTheme.headline6.copyWith(
      //         fontSize: 24,
      //         color: AppColors.black,
      //         fontWeight: FontWeight.w900,
      //         fontFamily: 'Metropolis',
      //       ), //

      //       //product title
      //       headline4: theme.textTheme.headline4.copyWith(
      //         color: AppColors.black,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         fontFamily: 'Metropolis',
      //       ),

      //       headline3: theme.textTheme.headline3.copyWith(
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w400,
      //       ),
      //       //product price
      //       headline2: theme.textTheme.headline2.copyWith(
      //         color: AppColors.lightGray,
      //         fontSize: 14,
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w400,
      //       ),
      //       headline1: theme.textTheme.headline1.copyWith(
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w500,
      //       ),

      //       subtitle2: theme.textTheme.subtitle2.copyWith(
      //         fontSize: 18,
      //         color: AppColors.black,
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w400,
      //       ),

      //       subtitle1: theme.textTheme.subtitle1.copyWith(
      //         fontSize: 24,
      //         color: AppColors.darkGray,
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w500,
      //       ),
      //       //red button with white text
      //       button: theme.textTheme.button.copyWith(
      //         fontSize: 14,
      //         color: AppColors.white,
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w500,
      //       ),
      //       //black caption title
      //       caption: theme.textTheme.caption.copyWith(
      //         fontSize: 34,
      //         color: AppColors.black,
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w700,
      //       ),
      //       //light gray small text
      //       bodyText1: theme.textTheme.bodyText1.copyWith(
      //         color: AppColors.lightGray,
      //         fontSize: 11,
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w400,
      //       ),
      //       //view all link
      //       bodyText2: theme.textTheme.bodyText2.copyWith(
      //         color: AppColors.black,
      //         fontSize: 11,
      //         fontFamily: 'Metropolis',
      //         fontWeight: FontWeight.w400,
      //       ),
      //     )
      //     .apply(fontFamily: 'Metropolis'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }
}
