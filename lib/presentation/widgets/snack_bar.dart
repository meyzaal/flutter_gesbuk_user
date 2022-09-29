import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';

class GesbukUserSnackBar {
  final BuildContext context;
  final String content;
  final String closeLabel;
  final Color? backgroundColor;

  GesbukUserSnackBar({
    required this.context,
    required this.content,
    this.backgroundColor,
    required this.closeLabel,
  });

  GesbukUserSnackBar.showSnackBar(
      this.context, this.content, this.backgroundColor, this.closeLabel) {
    ScaffoldMessenger.of(context).clearSnackBars();

    SnackBar snackBar = SnackBar(
      content: Text(content),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.baseSize)),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppSizes.widgetSidePadding),
      action: SnackBarAction(
          label: closeLabel,
          textColor: const Color.fromARGB(255, 216, 216, 216),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
