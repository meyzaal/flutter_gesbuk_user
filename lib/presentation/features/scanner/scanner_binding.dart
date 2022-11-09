import 'package:flutter_gesbuk_user/presentation/features/scanner/scanner.dart';
import 'package:get/get.dart';

class ScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannerController());
  }
}
