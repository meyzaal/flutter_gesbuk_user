import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/date.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/features/guest_list/guest_list.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class GuestListScreen extends GetView<GuestListController> {
  const GuestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
              title: Form(
                child: TextFormField(
                  controller: textEditingController,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed('/search_guest', arguments: controller.eventId);
                  },
                  readOnly: true,
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
            body: RefreshIndicator(
              onRefresh: () async => await controller.onRefresh(),
              child: controller.obx(
                (data) {
                  return SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Obx(
                        () => Column(
                          children: <Widget>[
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                itemBuilder: (context, index) {
                                  final Color avatarBackgroundColor =
                                      data?[index]?.category == 'vip'
                                          ? AppColors.secondaryColor
                                          : AppColors.lightBlue;

                                  DateTime? chekInTime =
                                      data?[index]?.checkInTime;
                                  String? parsedTime;
                                  String? parsedDate;
                                  if (chekInTime != null) {
                                    parsedTime =
                                        ParseDate.returnTime(chekInTime);
                                    parsedDate =
                                        ParseDate.returnYMD(chekInTime);
                                  }

                                  return GuestCard(
                                    guestCardType:
                                        GuestCardType.expansionalTile,
                                    guestName: '${data?[index]?.name}',
                                    address: '${data?[index]?.address}',
                                    category: '${data?[index]?.category}',
                                    checkInTime: data?[index]?.checkInTime,
                                    avatarBackgroundColor:
                                        avatarBackgroundColor,
                                    parsedTime: parsedTime ?? '',
                                    parsedDate: parsedDate ?? '',
                                    onExpansionChanged: (isExpanded) =>
                                        controller.isExpandedItem(
                                            index, isExpanded),
                                    onGuestCheckIn: () =>
                                        controller.setGuestCheckin(
                                            '${data?[index]?.id}',
                                            context,
                                            true),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: data?.length ?? 0),
                            controller.isScrollLoading.value
                                ? const SizedBox(height: 8.0)
                                : const SizedBox(),
                            controller.isScrollLoading.value
                                ? const CircularProgressIndicator.adaptive()
                                : const SizedBox(),
                            controller.isScrollLoading.value
                                ? const SizedBox(height: 16.0)
                                : const SizedBox(),
                          ],
                        ),
                      ));
                },
                onError: (error) => Center(
                  child: Text('Error cuy $error'),
                ),
                onLoading: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const ShimmerLoading(
                        type: ShimmerType.circle,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerLoading(
                            width: 8 * 10,
                            height:
                                Theme.of(context).textTheme.bodyText1?.fontSize,
                          ),
                          const SizedBox(height: 8.0)
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerLoading(
                            width: 8 * 14,
                            height:
                                Theme.of(context).textTheme.caption?.fontSize,
                          ),
                          const SizedBox(height: 4.0),
                          ShimmerLoading(
                            width: 8 * 8,
                            height:
                                Theme.of(context).textTheme.caption?.fontSize,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 8,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ),
            ),
            floatingActionButton: Obx(
              () => controller.isScrolled.value
                  ? FloatingActionButton(
                      onPressed: () {
                        controller.jumpToTop();
                      },
                      tooltip: 'Kembali ke atas',
                      backgroundColor: AppColors.mainColor,
                      mini: true,
                      child: const Icon(Icons.arrow_upward_rounded),
                    )
                  : const SizedBox(),
            )),
        Obx(() => controller.isPageLoading.value == true
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
