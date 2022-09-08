import 'package:flutter_gesbuk_user/presentation/features/price_list/price_list_controller.dart';
import 'package:get/get.dart';

class PriceListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PriceListController());
  }
}
