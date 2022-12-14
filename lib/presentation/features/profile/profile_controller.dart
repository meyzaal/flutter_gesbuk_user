import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/data/models/user_model.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_user_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with StateMixin<GesbukUserModel?> {
  final FetchUserUseCase _fetchUserUseCase;

  ProfileController(this._fetchUserUseCase);

  final AuthController authController = Get.find<AuthController>();

  RxBool isDark = false.obs;

  final url = Uri(
    scheme: 'https',
    host: 'play.google.com',
  );

  getUserInfo() async {
    try {
      final result = await _fetchUserUseCase.execute();
      GesbukUserModel? data = result;
      if (data?.role == 'admin') {
        return authController.signOut(
            error: 'Forbidden, hanya user yang bisa melanjutkan');
      }
      change(data, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  changeTheme(BuildContext context, bool state) {
    isDark.value = state;
    GesbukUserSnackBar.showSnackBar(context, 'This feature not yet available',
        Colors.red.shade400, 'tutup');
  }

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }
}
