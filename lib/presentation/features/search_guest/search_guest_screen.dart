import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/date.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/features/guest_list/guest_list.dart';
import 'package:flutter_gesbuk_user/presentation/features/search_guest/search_guest_controller.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/data_driven/guest_card.dart';
import 'package:get/get.dart';

class SearchGuestScreen extends GetView<SearchGuestController> {
  const SearchGuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GuestListController guestListController = Get.find<GuestListController>();
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                  controller.searchResults.clear();
                  FocusScope.of(context).unfocus();
                },
                icon: const Icon(Icons.arrow_back_rounded)),
            title: Form(
              child: TextFormField(
                onFieldSubmitted: (value) {
                  if (value != '') {
                    controller.searchResults.clear();
                    controller.searchGuest(value, context);
                  }
                },
                autofocus: true,
                decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.search_rounded),
                    ),
                    prefixIconConstraints:
                        const BoxConstraints(minHeight: 24.0, minWidth: 24.0),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            style: BorderStyle.none, width: 0.0)),
                    hintText: "Cari tamu"),
              ),
            ),
          ),
          body: controller.obx(
            (data) => SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      itemBuilder: (context, index) {
                        final Color avatarBackgroundColor =
                            data?[index].category == 'vip'
                                ? AppColors.secondaryColor
                                : AppColors.lightBlue;

                        DateTime? chekInTime = data?[index].checkInTime;
                        String? parsedTime;
                        String? parsedDate;
                        if (chekInTime != null) {
                          parsedTime = ParseDate.returnTime(chekInTime);
                          parsedDate = ParseDate.returnYMD(chekInTime);
                        }

                        return GuestCard(
                          guestCardType: GuestCardType.expansionalTile,
                          avatarBackgroundColor: avatarBackgroundColor,
                          parsedTime: '$parsedTime',
                          parsedDate: '$parsedDate',
                          guestName: '${data?[index].name}',
                          address: '${data?[index].address}',
                          category: '${data?[index].category}',
                          checkInTime: data?[index].checkInTime,
                          onExpansionChanged: (isExpanded) {
                            guestListController.isExpandedItem(
                                index, isExpanded);
                          },
                          onGuestCheckIn: () => controller.setGuestCheckin(
                              '${data?[index].id}', context),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: data?.length ?? 0),
                  controller.isDataLoading.value
                      ? const SizedBox(height: 8.0)
                      : const SizedBox(),
                  controller.isDataLoading.value
                      ? const CircularProgressIndicator.adaptive()
                      : const SizedBox(),
                  controller.isDataLoading.value
                      ? const SizedBox(height: 16.0)
                      : const SizedBox(),
                ],
              ),
            ),
            onLoading: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            onEmpty: const Center(
              child: Text('Tamu tidak ditemukan'),
            ),
          ),
        ),
        Obx(() => controller.isPageLoading.value
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black38,
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              )
            : const SizedBox())
      ],
    );
  }
}
