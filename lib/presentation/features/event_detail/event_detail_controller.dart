import 'package:flutter_gesbuk_user/data/models/event_detail_model.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_event_detail_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController
    with StateMixin<EventDetailModel?> {
  final FetchEventDetailUseCase _fetchEventDetailUseCase;

  EventDetailController(this._fetchEventDetailUseCase);

  final AuthController authController = Get.find<AuthController>();
  RxBool isFinishFetchData = false.obs;

  String eventId = Get.arguments;
  RxBool isLoading = true.obs;

  Future<void> onRefresh() async {
    if (!isFinishFetchData.value) return;
    change(null, status: RxStatus.loading());
    return onInit();
  }

  Future<void> getEventDetail() async {
    try {
      final events = await _fetchEventDetailUseCase.execute(eventId);
      EventDetailModel? data = events;
      isLoading.value = false;
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
      return change(null, status: RxStatus.error(error.toString()));
    }
  }

  @override
  void onInit() async {
    isFinishFetchData.value = false;
    await getEventDetail();
    super.onInit();
  }
}
