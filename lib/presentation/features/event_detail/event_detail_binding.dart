import 'package:flutter_gesbuk_user/data/repository/event_repository.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_event_detail_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/event_detail/event_detail_controller.dart';
import 'package:get/get.dart';

class EventDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventRepositoryIml());
    Get.lazyPut(() => FetchEventDetailUseCase(Get.find<EventRepositoryIml>()));
    Get.lazyPut(
        () => EventDetailController(Get.find<FetchEventDetailUseCase>()));
  }
}
