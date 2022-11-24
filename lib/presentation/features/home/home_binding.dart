import 'package:flutter_gesbuk_user/data/repository/event_repository.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_upcoming_event_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventRepositoryIml());
    Get.lazyPut(
        () => FetchUpcomingEventUseCase(Get.find<EventRepositoryIml>()));
    Get.lazyPut(() => HomeController(Get.find<FetchUpcomingEventUseCase>()));
  }
}
