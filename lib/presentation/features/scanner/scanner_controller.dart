import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerController extends GetxController {
  RxBool scanning = false.obs;
  RxBool isFlashOn = false.obs;
  Rx<CameraFacing> cameraFacing = CameraFacing.back.obs;
  QRViewController? qrViewController;

  void setScanning(bool value) {
    scanning.value = value;
  }

  void setQRViewController(QRViewController? controller) {
    qrViewController = controller;
    update();
  }

  void toggleFlash(QRViewController? controller) async {
    try {
      qrViewController = controller;

      await controller?.toggleFlash();
      final status = await controller?.getFlashStatus();

      if (status != null) {
        isFlashOn.value = status;
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void flipCamera(QRViewController? controller) async {
    try {
      qrViewController = controller;

      await controller?.flipCamera();
      final status = await controller?.getCameraInfo();

      if (status != null) {
        cameraFacing.value = status;
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
