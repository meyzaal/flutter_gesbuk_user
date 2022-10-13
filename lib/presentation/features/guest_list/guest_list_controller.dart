import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/data/models/guest_model.dart';
import 'package:flutter_gesbuk_user/data/models/guest_response_model.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/fetch_guest_use_case.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/guest_checkin_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/event_detail/event_detail.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuple/tuple.dart';

class GuestListController extends GetxController
    with StateMixin<List<GuestModel?>> {
  final FetchGuestUseCase _fetchGuestUseCase;

  GuestListController(this._fetchGuestUseCase);

  final GuestCheckInUseCase _guestCheckInUseCase =
      Get.find<GuestCheckInUseCase>();

  final scrollController = ScrollController();
  final _result = Rx<GuestResponseModel?>(null);
  final int _limit = 20;
  final RxBool isPageLoading = false.obs;
  final RxBool isScrollLoading = false.obs;
  final RxBool isScrolled = false.obs;
  final RxBool isSuccessUploadImage = false.obs;
  final TextEditingController textEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  int _currentPage = 1;
  int? totalResults;
  String? eventId = Get.arguments;
  bool _isLoadMore = false;
  final RxBool _isFinishFetchData = false.obs;

  var guests = RxList<GuestModel>();

  Future<void> onRefresh() async {
    if (!_isFinishFetchData.value) return;
    change(null, status: RxStatus.loading());
    return onInit();
  }

  Future<void> fetchAllGuest() async {
    try {
      _isFinishFetchData.value = false;
      _currentPage = 1;
      final query = {
        'page': _currentPage.toString(),
        'limit': _limit.toString(),
      };
      final result = await _fetchGuestUseCase.execute(Tuple2(eventId, query));

      guests.assignAll(result?.listData ?? []);
      _result.value = result;
      totalResults = result?.totalResults;
      _isFinishFetchData.value = true;
      return change(result?.listData, status: RxStatus.success());
    } catch (error) {
      _isFinishFetchData.value = true;
      return change(null, status: RxStatus.error(error.toString()));
    }
  }

  void isExpandedItem(int index, bool isExpanded) {
    guests[index].isExpanded = !isExpanded;

    change(guests, status: RxStatus.success());
  }

  void _initializeScrollController() {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 500) {
      loadMore();
    }

    showFAB();
  }

  void showFAB() {
    if (scrollController.offset > 300) {
      isScrolled.value = true;
    } else {
      isScrolled.value = false;
    }
  }

  void jumpToTop() {
    scrollController.position.animateTo(0,
        curve: Curves.easeOutQuint, duration: const Duration(seconds: 1));
  }

  Future<GuestModel?> setGuestCheckin(
      String id, BuildContext context, bool isGuestListController) async {
    try {
      final guestId = id;
      GuestModel? response;
      isPageLoading.value = true;

      await _guestCheckInUseCase.execute(guestId).then(
        (result) async {
          if (isGuestListController) {
            final doc = guests.where((guest) => guest.id == result?.id);
            doc.first.checkInTime = result?.checkInTime;
            change(guests, status: RxStatus.success());
          }
          response = result;

          isPageLoading.value = false;
          await showDialog<void>(
              barrierDismissible: false,
              context: (context),
              builder: (context) {
                return Obx(
                  () => GesbukUserAlertDialog(
                    actionsAlignment: isSuccessUploadImage.value
                        ? null
                        : MainAxisAlignment.spaceBetween,
                    alertType: AlertType.success,
                    title: 'Berhasil check-in',
                    content: Column(
                      children: [
                        Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const <int, TableColumnWidth>{
                            0: IntrinsicColumnWidth(),
                            1: IntrinsicColumnWidth(flex: 1),
                          },
                          children: <TableRow>[
                            TableRow(children: <Widget>[
                              Text('Nama ',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Text(': ${result?.name}',
                                  style: Theme.of(context).textTheme.bodyText1)
                            ]),
                            TableRow(children: <Widget>[
                              Text('Alamat ',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Text(': ${result?.address}',
                                  style: Theme.of(context).textTheme.bodyText1)
                            ]),
                            TableRow(children: <Widget>[
                              Text('Kategori ',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Text(': ${result?.category}'.toUpperCase(),
                                  style: Theme.of(context).textTheme.bodyText1)
                            ]),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            isSuccessUploadImage.value
                                ? const SizedBox(height: 24.0)
                                : const SizedBox(),
                            isSuccessUploadImage.value
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.check_circle,
                                          color: Colors.green, size: 16.0),
                                      const SizedBox(width: 16.0),
                                      Text(
                                        'Foto berhasil dikirim',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      isSuccessUploadImage.value
                          ? const SizedBox()
                          : GesbukUserPrimaryButtonIcon(
                              isExpand: false,
                              label: 'Ambil Foto',
                              icon: Icons.camera_alt_rounded,
                              onPressed: () {
                                takePicture();
                              },
                              isImageIcon: false,
                            ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Tutup')),
                    ],
                  ),
                );
              });
        },
      );
      Get.find<EventDetailController>().getEventDetail();
      return response;
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
                    },
                    child: const Text('Tutup'))
              ],
            );
          });
      throw Exception(error.toString());
    }
  }

  void loadMore() async {
    final totalResults = _result.value?.totalResults ?? 0;
    if (totalResults / _limit <= _currentPage) return;
    if (_isLoadMore) return;

    _isLoadMore = true;
    isScrollLoading.value = true;
    _currentPage += 1;
    final query = {
      'page': _currentPage.toString(),
      'limit': _limit.toString(),
    };

    final result = await _fetchGuestUseCase.execute(Tuple2(eventId, query));
    guests.addAll(result?.listData ?? []);
    change(guests, status: RxStatus.success());
    _result.value?.totalResults = result?.totalResults;
    _isLoadMore = false;
    isScrollLoading.value = false;
  }

  Future<void> _imagePreview(XFile? image) async {
    var context = Get.context!;

    if (image != null) {
      Get.toNamed('/image_preview', arguments: image);
      isSuccessUploadImage.value = true;
    } else {
      GesbukUserSnackBar.showSnackBar(context,
          'You have not yet picked an image.', Colors.red.shade400, 'Tutup');
    }
  }

  Future<void> takePicture() async {
    var context = Get.context!;

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      isSuccessUploadImage.value = true;
      _imagePreview(image);
    } catch (error) {
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
                    },
                    child: const Text('Tutup'))
              ],
            );
          });
    }
  }

  @override
  void onInit() async {
    await fetchAllGuest();
    _initializeScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    textEditingController.dispose();
    super.onClose();
  }
}
