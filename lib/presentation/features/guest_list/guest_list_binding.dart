import 'package:flutter_gesbuk_user/data/repository/guest_repository.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_guest_use_case.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/guest_checkin_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/guest_list/guest_list.dart';
import 'package:get/get.dart';

class GuestListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestRepositoryIml());
    Get.lazyPut(() => FetchGuestUseCase(Get.find<GuestRepositoryIml>()));
    Get.lazyPut(() => GuestCheckInUseCase(Get.find<GuestRepositoryIml>()));
    Get.lazyPut(() => GuestListController(Get.find<FetchGuestUseCase>()));
  }
}
