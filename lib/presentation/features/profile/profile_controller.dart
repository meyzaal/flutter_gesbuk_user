import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isDark = false.obs;

  changeTheme(BuildContext context, bool state) {
    ScaffoldMessenger.of(context).clearSnackBars();
    isDark.value = state;

    SnackBar snackBar = SnackBar(
      content: const Text('Feature not yet available'),
      backgroundColor: Colors.red.shade400,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.baseSize)),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppSizes.widgetSidePadding),
      action: SnackBarAction(
          label: 'tutup',
          textColor: const Color.fromARGB(255, 216, 216, 216),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Get.showSnackbar(const GetSnackBar(
    //     title: 'Sorry', message: 'Feature not yet available'));

    // Future.delayed(const Duration(seconds: 3));
    // Get.closeCurrentSnackbar();
  }

  // Future<void> _successDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return const GesbukUserAlertDialog(alertType: AlertType.success);
  //     },
  //   );
  // }
}
