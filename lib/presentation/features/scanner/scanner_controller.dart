import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerController extends GetxController with StateMixin {
  RxBool scanning = false.obs;
  QRViewController? qrViewController;

  void setScanning(dynamic value) {
    scanning.value = value;
  }

   void setQRViewController(QRViewController? controller) {
    qrViewController = controller;
    update();
  }
}
