import 'package:flutter_gesbuk_user/app/services/local_storage.dart';
import 'package:flutter_gesbuk_user/data/repository/auth_repository.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/sign_in_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalStorageService());
    Get.lazyPut(() => AuthRepositoryIml());
    Get.lazyPut(() => SignInUseCase(Get.find<AuthRepositoryIml>()));
    Get.lazyPut(() => AuthController());
  }
}
