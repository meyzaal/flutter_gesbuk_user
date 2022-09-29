import 'package:flutter_gesbuk_user/data/repository/event_repository.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/enroll_event_use_case.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_event_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event_controller.dart';
import 'package:get/get.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventRepositoryIml());
    Get.lazyPut(() => FetchEventUseCase(Get.find<EventRepositoryIml>()));
    Get.lazyPut(() => EnrollEventUseCase(Get.find<EventRepositoryIml>()));
    Get.lazyPut(() => EventController(Get.find()));
  }
}
