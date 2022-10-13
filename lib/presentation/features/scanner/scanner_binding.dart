import 'package:flutter_gesbuk_user/data/repository/guest_repository.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/guest_checkin_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/scanner/scanner.dart';
import 'package:get/get.dart';

class ScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannerController());
  }
}
