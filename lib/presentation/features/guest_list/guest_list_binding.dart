import 'package:flutter_gesbuk_user/presentation/features/guest_list/guest_list.dart';
import 'package:get/get.dart';

class GuestListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestListController());
  }
}
