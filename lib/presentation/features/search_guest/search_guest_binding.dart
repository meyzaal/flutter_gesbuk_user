import 'package:flutter_gesbuk_user/data/repository/guest_repository.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_guest_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/search_guest/search_guest_controller.dart';
import 'package:get/get.dart';

class SearchGuestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestRepositoryIml());
    Get.lazyPut(() => FetchGuestUseCase(Get.find<GuestRepositoryIml>()));
    Get.lazyPut(() => SearchGuestController(Get.find<FetchGuestUseCase>()));
  }
}
