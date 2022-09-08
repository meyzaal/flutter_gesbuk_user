import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:get/get.dart';

enum AlertType { success, info, failed }

class GesbukUserAlertDialog extends StatelessWidget {
  final AlertType alertType;
  final String? middleText;

  const GesbukUserAlertDialog({
    Key? key,
    required this.alertType,
    this.middleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? color;
    IconData? icon;

    switch (alertType) {
      case AlertType.success:
        color = AppColors.success;
        icon = Icons.done_rounded;
        break;
      default:
    }

    return AlertDialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.widgetBorderRadius)),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            icon != null
                ? Icon(
                    icon,
                    color: color ?? AppColors.black,
                    size: AppSizes.baseSize * 12,
                  )
                : const SizedBox(),
            const SizedBox(height: AppSizes.baseSize),
            Text(middleText ?? '')
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.arrow_back_rounded),
              SizedBox(width: 4.0),
              Text('Kembali'),
            ],
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
