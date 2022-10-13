import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/date.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/features/event_detail/event_detail_controller.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends GetView<EventDetailController> {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GesbukUserScaffold(
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
      ],
      body: RefreshIndicator(
        onRefresh: () async => await controller.onRefresh(),
        child: controller.obx(
          (data) {
            final date =
                DateFormat.yMMMMd().format(data?.startDate ?? DateTime.now());

            return ListView(
              children: <Widget>[
                Container(
                  height: 8 * 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${data?.imageUrl}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${data?.name}',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.pin_drop_rounded,
                            size: 16.0,
                          ),
                          const SizedBox(width: AppSizes.baseSize),
                          Text('${data?.location}',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.people_rounded,
                            size: 16.0,
                          ),
                          const SizedBox(width: AppSizes.baseSize),
                          Text(
                            '${data?.guestList?.length} Guest',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.event,
                            size: 16.0,
                          ),
                          const SizedBox(width: AppSizes.baseSize),
                          Text(
                            date,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 8.0),
                Obx(() => controller.isLoading.value == true
                    ? _buildGuestListLoading(context)
                    : Container(
                        margin: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Daftar tamu',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600)),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () => Get.toNamed('/guest_list',
                                        arguments: controller.eventId),
                                    child: const Text('Lihat semua'))
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final Color avatarBackgroundColor =
                                    data?.guestList?[index].category == 'vip'
                                        ? AppColors.secondaryColor
                                        : AppColors.lightBlue;

                                DateTime? chekInTime =
                                    data?.guestList?[index].checkInTime;
                                String? parsedTime;
                                String? parsedDate;
                                if (chekInTime != null) {
                                  parsedTime = ParseDate.returnTime(chekInTime);
                                  parsedDate = ParseDate.returnYMD(chekInTime);
                                }

                                return GuestCard(
                                  guestCardType: GuestCardType.listTile,
                                  avatarBackgroundColor: avatarBackgroundColor,
                                  parsedTime: parsedTime ?? '',
                                  parsedDate: parsedDate ?? '',
                                  guestName: '${data?.guestList?[index].name}',
                                  address: '${data?.guestList?[index].address}',
                                  category:
                                      '${data?.guestList?[index].category}',
                                  checkInTime:
                                      data?.guestList?[index].checkInTime,
                                );
                              },
                              itemCount: (data?.guestList?.length ?? 0) > 5
                                  ? 5
                                  : data?.guestList?.length ?? 0,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider();
                              },
                            )
                          ],
                        ),
                      ))
              ],
            );
          },
          onLoading: ListView(
            children: <Widget>[
              ShimmerLoading(
                withBorderRadius: false,
                height: 8 * 24,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ShimmerLoading(
                      width: 8 * 18,
                      height: Theme.of(context).textTheme.headline6?.fontSize,
                    ),
                    const SizedBox(height: 8.0),
                    ShimmerLoading(
                        width: 8 * 12,
                        height:
                            Theme.of(context).textTheme.bodyText1?.fontSize),
                    const SizedBox(height: 4.0),
                    ShimmerLoading(
                      width: 8 * 8,
                      height: Theme.of(context).textTheme.bodyText1?.fontSize,
                    ),
                    const SizedBox(height: 4.0),
                    ShimmerLoading(
                      width: 8 * 16,
                      height: Theme.of(context).textTheme.bodyText1?.fontSize,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              _buildGuestListLoading(context)
            ],
          ),
          onEmpty: const Center(
            child: Text('Data kosong'),
          ),
          onError: (error) => const Center(
            child: Text('Data kosong'),
          ),
        ),
      ),
      bottomNavBar: Obx(
        () => controller.isFinishFetchData.value
            ? Container(
                padding: const EdgeInsets.all(8.0),
                color: AppColors.backgroundLight,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GesbukUserPrimaryButtonIcon(
                        label: 'Scan Tamu',
                        icon: Icons.qr_code_rounded,
                        onPressed: () => Get.toNamed('/scanner'),
                        isImageIcon: false,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: GesbukUserSecondaryButtonIcon(
                          label: 'Cari Tamu',
                          icon: Icons.search_rounded,
                          onPressed: () => Get.toNamed('/search_guest',
                              arguments: controller.eventId)),
                    )
                  ],
                ),
              )
            : const SizedBox(),
      ),
      backButton: true,
      appBarTitle: 'Detail Event',
    );
  }

  Container _buildGuestListLoading(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ShimmerLoading(
              width: 8 * 12,
              height: Theme.of(context).textTheme.subtitle1?.fontSize),
          const SizedBox(height: 16.0),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                      height: Theme.of(context).textTheme.bodyText1?.fontSize,
                    ),
                    const SizedBox(height: 8.0)
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerLoading(
                      width: 8 * 14,
                      height: Theme.of(context).textTheme.caption?.fontSize,
                    ),
                    const SizedBox(height: 4.0),
                    ShimmerLoading(
                      width: 8 * 8,
                      height: Theme.of(context).textTheme.caption?.fontSize,
                    ),
                  ],
                ),
              );
            },
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          )
        ],
      ),
    );
  }
}
