import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  // final ProfileController profileController = Get.find<ProfileController>();
  // final AuthController authController = Get.find<AuthController>();

  Future<void> createAddPhoneDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return GesbukUserAlertDialog(
          alertType: AlertType.success,
          middleText: 'Berhasil menambahkan Event.',
          actions: <Widget>[
            TextButton(onPressed: () => Get.back(), child: const Text('Tutup'))
          ],
        );
      },
    );
  }

  Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
