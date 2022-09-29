import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/enroll_event_use_case.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_event_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

enum DialogType { success, error }

class EventController extends GetxController with StateMixin<List<EventModel>> {
  final FetchEventUseCase _fetchEventUseCase;

  EventController(this._fetchEventUseCase);

  final AuthController authController = Get.find<AuthController>();
  final EnrollEventUseCase _enrollEventUseCase = Get.find<EnrollEventUseCase>();

  final TextEditingController keyController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;
  final RxString result = ''.obs;
  final context = Get.context!;

  void formValidation(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Get.back();
      isLoading.value = true;
      await _enrollEventUseCase.execute(keyController.text).then((value) {
        isLoading.value = false;
        if (value != null) {
          Get.back();
          createEventDialog(DialogType.success, 'Berhasil menambahkan Event');
        } else {
          Get.back();
          createEventDialog(DialogType.error, 'Gagal menambahkan Event');
        }
      }, onError: (error) {
        Get.back();
        isLoading.value = false;
        if (error.toString().contains('Bad Request')) {
          Get.back();
          createEventDialog(
              DialogType.error, 'Gagal menambahkan event, event key salah');
        } else {
          Get.back();
          createEventDialog(DialogType.error, error.toString());
        }
      });
    }
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return result.value = 'Kode event tidak boleh kosong.';
    }
    if (value.length < 10 || value.length > 10) {
      return result.value = 'Masukkan kode event dengan benar';
    }
    return null;
  }

  Future<void> getEvent() async {
    try {
      final events = await _fetchEventUseCase.execute();
      List<EventModel>? data = events;
      return change(data, status: RxStatus.success());
    } catch (error) {
      if (error.toString().contains('Firebase ID token has expired')) {
        await authController.setFreshToken();
        return Get.find<EventController>().onInit();
      }

      if (error.toString().contains('unauthorized')) {
        return authController.signOut(error: 'Unauthorized');
      }
      if (error.toString().contains('forbidden')) {
        return authController.signOut(error: '403 Forbidden');
      }
      if (error.toString().contains('Data tidak ditemukan')) {
        return change(null, status: RxStatus.empty());
      }
      return change(null, status: RxStatus.error(error.toString()));
    }
  }

  Future<void> createEventDialog(DialogType type, String? message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return type == DialogType.success
            ? GesbukUserAlertDialog(
                alertType: AlertType.success,
                middleText: message,
                onClosed: () {
                  Get.back();
                  keyController.text = '';
                  Get.find<EventController>().onInit();
                },
              )
            : GesbukUserAlertDialog(
                alertType: AlertType.failed,
                middleText: message,
                onClosed: () {
                  Get.back();
                  keyController.text = '';
                  Get.find<EventController>().onInit();
                },
              );
      },
    );
  }

  @override
  void onInit() {
    getEvent();
    super.onInit();
  }

  @override
  void onClose() {
    keyController.dispose();
    super.onClose();
  }
}
