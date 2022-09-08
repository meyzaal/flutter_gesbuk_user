import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  BuildContext context = Get.context!;

  Future<void> _successDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return const GesbukUserAlertDialog(alertType: AlertType.success);
      },
    );
  }
}
