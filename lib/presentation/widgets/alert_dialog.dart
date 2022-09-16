import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AlertType { success, info, failed }

class GesbukUserAlertDialog extends StatelessWidget {
  final AlertType alertType;
  final String? title;
  final String? middleText;
  final void Function() onClosed;

  const GesbukUserAlertDialog({
    Key? key,
    required this.alertType,
    this.middleText,
    required this.onClosed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? image;

    switch (alertType) {
      case AlertType.success:
        image = 'assets/images/undraw_order_confirmed_re_g0if.svg';
        break;
      default:
    }

    return AlertDialog(
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
            // icon != null
            //     ? CircleAvatar(
            //         radius: AppSizes.imageRadius * 8,
            //         backgroundColor: AppColors.green,
            //         child: Icon(
            //           icon,
            //           color: color,
            //           size: AppSizes.baseSize * 8,
            //         ),
            //       )
            //     : const SizedBox(),
            const SizedBox(height: 24.0),
            title != null
                ? Text(title ?? '',
                    style: Theme.of(context).textTheme.subtitle1)
                : const SizedBox(),
            middleText != null
                ? Text(
                    middleText ?? '',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                : const SizedBox()
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(onPressed: onClosed, child: const Text('Tutup')),
      ],
    );
  }
}
