import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_event_use_case.dart';
import 'package:get/get.dart';

class EventController extends GetxController with StateMixin<List<EventModel>> {
  final FetchEventUseCase _fetchEventUseCase;

  EventController(this._fetchEventUseCase);

  getEvent() async {
    try {
      final result = await _fetchEventUseCase.execute();
      List<EventModel>? events = result;
      change(events, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  @override
  void onInit() {
    getEvent();
    super.onInit();
  }
}
