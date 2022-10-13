import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AlertType { success, info, failed }

class GesbukUserAlertDialog extends StatelessWidget {
  final AlertType? alertType;
  final String? title;
  final String? middleText;
  final Widget? content;
  final MainAxisAlignment? actionsAlignment;
  final List<Widget>? actions;

  const GesbukUserAlertDialog({
    Key? key,
    this.alertType,
    this.middleText,
    this.title,
    this.actions,
    this.content,
    this.actionsAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? image;

    switch (alertType) {
      case AlertType.success:
        image = 'assets/images/undraw_order_confirmed_re_g0if.svg';
        break;
      case AlertType.failed:
        image = 'assets/images/undraw_warning_re_eoyh.svg';
        break;
      default:
        image = null;
    }

    return AlertDialog(
        actionsAlignment: actionsAlignment,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.widgetBorderRadius)),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              
              image != null
                  ? SvgPicture.asset(
                      image,
                      width: AppSizes.baseSize * 24,
                    )
                  : const SizedBox(),
              image != null ? const SizedBox(height: 24.0) : const SizedBox(),
              title != null
                  ? Text(title ?? '',
                      style: Theme.of(context).textTheme.subtitle1)
                  : const SizedBox(),
              middleText != null
                  ? Text(
                      middleText ?? '',
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  : const SizedBox(),
              content != null ? const SizedBox(height: 16.0) : const SizedBox(),
              content ?? const SizedBox()
            ],
          ),
        ),
        actions: actions);
  }
}
