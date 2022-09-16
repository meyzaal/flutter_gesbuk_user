import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_event_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class EventController extends GetxController with StateMixin<List<EventModel>> {
  final FetchEventUseCase _fetchEventUseCase;

  EventController(this._fetchEventUseCase);

  final TextEditingController keyController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxString result = ''.obs;

  void formValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Get.back();
      createEventDialog(context);
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
      final result = await _fetchEventUseCase.execute();
      List<EventModel>? events = result;
      change(events, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  Future<void> createEventDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return GesbukUserAlertDialog(
          alertType: AlertType.success,
          middleText: 'Berhasil menambahkan Event.',
          onClosed: () {
            change(null, status: RxStatus.loading());
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
