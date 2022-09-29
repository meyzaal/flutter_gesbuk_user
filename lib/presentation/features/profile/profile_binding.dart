import 'package:flutter_gesbuk_user/data/repository/auth_repository.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_user_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepositoryIml());
    Get.lazyPut(() => FetchUserUseCase(Get.find<AuthRepositoryIml>()));
    Get.lazyPut(() => ProfileController(Get.find()));
  }
}
