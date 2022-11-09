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
  final RxBool isFinishFetchData = false.obs;
  final RxString result = ''.obs;
  final context = Get.context!;

  Future<void> onRefresh() async {
    if (isFinishFetchData.value) {
      change(null, status: RxStatus.loading());
      return onInit();
    } else {
      return;
    }
  }

  void formValidation(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Get.back();
      isLoading.value = true;
      await _enrollEventUseCase.execute(keyController.text).then((value) {
        isLoading.value = false;
        if (value != null) {
          createEventDialog(DialogType.success, 'Berhasil menambahkan Event');
        } else {
          createEventDialog(DialogType.error, 'Gagal menambahkan Event');
        }
      }, onError: (error) {
        isLoading.value = false;
        if (error.toString().contains('Bad Request')) {
          createEventDialog(
              DialogType.error, 'Gagal menambahkan event, event key salah');
        } else {
          createEventDialog(DialogType.error, error.toString());
        }
      });
    }
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return result.value = 'Kode event tidak boleh kosong.';
    }
    if (value.length != 10) {
      return result.value = 'Masukkan kode event dengan benar';
    }
    return null;
  }

  Future<void> getEvent() async {
    try {
      final events = await _fetchEventUseCase.execute();
      List<EventModel>? data = events;
      isFinishFetchData.value = true;

      return change(data, status: RxStatus.success());
    } catch (error) {
      isFinishFetchData.value = true;
      if (error.toString().contains('unauthorized')) {
        return authController.signOut(error: 'Unauthorized');
      }
      if (error.toString().contains('forbidden')) {
        return authController.signOut(error: '403 Forbidden');
      }
      if (error.toString().contains('Data tidak ditemukan')) {
        return change(null, status: RxStatus.empty());
      }
      GesbukUserSnackBar.showSnackBar(
          context, '$error', Colors.red.shade400, 'Tutup');
      return change(null, status: RxStatus.error(error.toString()));
    }
  }

  Future<void> createEventDialog(DialogType type, String? message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return type == DialogType.success
            ? GesbukUserAlertDialog(
                alertType: AlertType.success,
                middleText: message,
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Get.back();
                        keyController.clear();
                        change(null, status: RxStatus.loading());
                        Get.find<EventController>().onInit();
                      },
                      child: const Text('Tutup'))
                ],
              )
            : GesbukUserAlertDialog(
                alertType: AlertType.failed,
                middleText: message,
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Get.back();
                        keyController.clear();
                      },
                      child: const Text('Tutup'))
                ],
              );
      },
    );
  }

  @override
  void onInit() async {
    await getEvent();
    super.onInit();
  }

  @override
  void onClose() {
    keyController.dispose();
    super.onClose();
  }
}
