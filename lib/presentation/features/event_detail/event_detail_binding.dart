import 'package:flutter_gesbuk_user/presentation/features/event_detail/event_detail_controller.dart';
import 'package:get/get.dart';

class EventDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventDetailController());
  }
}
