import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/data/models/guest_model.dart';
import 'package:flutter_gesbuk_user/data/models/guest_response_model.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_guest_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/event_detail/event_detail.dart';
import 'package:flutter_gesbuk_user/presentation/features/guest_list/guest_list.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class SearchGuestController extends GetxController
    with StateMixin<List<GuestModel>> {
  final FetchGuestUseCase _fetchGuestUseCase;

  SearchGuestController(this._fetchGuestUseCase);

  final GuestListController _guestListController =
      Get.find<GuestListController>();

  var searchResults = RxList<GuestModel>();

  final RxBool isPageLoading = false.obs;
  final RxBool isDataLoading = false.obs;
  final int _limit = 20;
  final _result = Rx<GuestResponseModel?>(null);

  int? totalResults;
  String eventId = Get.arguments;
  final int _currentPage = 1;

  void searchGuest(String keyword, BuildContext context) async {
    try {
      change(null, status: RxStatus.loading());
      final query = {
        'page': _currentPage.toString(),
        'limit': _limit.toString(),
        'keyword': keyword,
      };

      var result = await _fetchGuestUseCase.execute(Tuple2(eventId, query));

      searchResults.assignAll(result?.listData ?? []);
      change(result?.listData, status: RxStatus.success());
      _result.value = result;

      if (result != null && _result.value != null) {
        if (result.totalResults! > _result.value!.listData!.length) {
          isDataLoading.value = true;
          final query = {
            'page': _currentPage.toString(),
            'limit': result.totalResults.toString(),
            'keyword': keyword,
          };

          final res = await _fetchGuestUseCase.execute(Tuple2(eventId, query));
          if (res?.listData != null) {
            searchResults.addAll(res!.listData!);
            change(searchResults, status: RxStatus.success());
            isDataLoading.value = false;
          }
        }
      }
    } catch (error) {
      if (error.toString().contains('Invalid Request')) {
        if (error.toString().contains('Data tidak ditemukan')) {
          change(null, status: RxStatus.empty());
        }
        return;
      }
      showDialog(
        context: context,
        builder: (context) {
          return GesbukUserAlertDialog(
            alertType: AlertType.failed,
            title: 'Error',
            middleText: error.toString(),
          );
        },
      );
      change(null, status: RxStatus.success());
    }
  }

  setGuestCheckin(String id, BuildContext context) async {
    try {
      isPageLoading.value = true;

      await _guestListController
          .setGuestCheckin(id, context, false)
          .then((value) async {
        final doc = searchResults.where((guest) => guest.id == value?.id);
        doc.first.checkInTime = value?.checkInTime;

        change(searchResults, status: RxStatus.success());

        isPageLoading.value = false;
      });
      _guestListController.fetchAllGuest();
      Get.find<EventDetailController>().getEventDetail();
    } catch (error) {
      isPageLoading.value = false;
      await showDialog<void>(
          context: context,
          builder: (context) {
            return GesbukUserAlertDialog(
              alertType: AlertType.failed,
              middleText: error.toString(),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                    child: const Text('Tutup'))
              ],
            );
          });
    }
  }

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    searchResults.value = [];
    super.onInit();
  }
}
