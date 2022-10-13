import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/date.dart';
import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EventScreen extends GetView<EventController> {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GesbukUserScaffold(
          appBarTitle: 'My Event',
          body: RefreshIndicator(
            onRefresh: () async => await controller.onRefresh(),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  controller.obx(
                    (data) {
                      return Padding(
                        padding: const EdgeInsets.all(AppSizes.sidePadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Event kamu',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 16.0),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/event_detail',
                                          arguments: data?[index].id);
                                      controller.keyController.clear();
                                    },
                                    child:
                                        _buildEventCard(context, index, data));
                              },
                              itemCount: data?.length ?? 0,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(height: 16.0),
                            ),
                          ],
                        ),
                      );
                    },
                    onLoading: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.26,
                        child: const Center(
                            child: CircularProgressIndicator.adaptive())),
                    onEmpty: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSizes.sidePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/images/undraw_events_re_98ue.svg',
                              height: AppSizes.baseSize * 16,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.center,
                            child: Text('Kamu belum ada event.',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 8.0),
                  _buildRedeemButton(context),
                ],
              ),
            ),
          ),
          bottomMenuIndex: 1,
        ),
        Obx(() => controller.isLoading.value == true
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

  Container _buildRedeemButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(AppSizes.sidePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Buat event',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 16.0),
          Text(
              'Kamu bisa menambahkan event dengan memasukkan kode event yang kamu punya.',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 8.0),
          GesbukUserSecondaryButtonIcon(
              label: 'Masukkan kode event',
              isExpand: true,
              icon: Icons.discount_rounded,
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.widgetBorderRadius),
                      topRight: Radius.circular(AppSizes.widgetBorderRadius),
                    ),
                  ),
                  context: context,
                  builder: (context) => _buildRedeemBottomSheet(context),
                );
              }),
        ],
      ),
    );
  }

  Container _buildRedeemBottomSheet(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(AppSizes.widgetSidePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Get.back();
                controller.keyController.clear();
              },
              icon: const Icon(Icons.close_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.widgetSidePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Punya kode event?',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Masukkan 10 digit kode event kamu di sini.'),
                  const SizedBox(height: 4.0),
                  Obx(() {
                    return Column(
                      children: [
                        Form(
                          key: controller.formKey,
                          child: GesbukUserTextField(
                            controller: controller.keyController,
                            autoFocus: true,
                            validator: (String? value) =>
                                controller.validator(value),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        GesbukUserPrimaryButton(
                            label: 'Validasi',
                            onPressed: () =>
                                controller.formValidation(context)),
                        controller.result.value != ''
                            ? const SizedBox()
                            : const SizedBox()
                      ],
                    );
                  }),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildEventCard(
      BuildContext context, int index, List<EventModel>? data) {
    const imageUrl =
        // 'https://images.unsplash.com/photo-1553915632-175f60dd8e36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
        // 'https://images.unsplash.com/photo-1562967005-a3c85514d3e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
        // 'https://images.unsplash.com/photo-1544531585-f14f463149ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
        // 'https://images.unsplash.com/photo-1565035010268-a3816f98589a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80';
        'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80';

    return Container(
      height: AppSizes.baseSize * 32,
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.baseSize),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
            image: NetworkImage(data?[index].imageUrl ?? imageUrl),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(AppSizes.widgetSidePadding),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightGray,
            blurRadius: 3.0,
            offset: Offset(1, 3),
          )
        ],
      ),
      child: _buildEventInfoCard(context, index, data),
    );
  }

  Opacity _buildEventInfoCard(
      BuildContext context, int index, List<EventModel>? data) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        height: AppSizes.baseSize * 14,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(AppSizes.sidePadding),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.white,
              Colors.white70,
              Colors.white,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(AppSizes.widgetBorderRadius / 2),
          boxShadow: const [
            BoxShadow(
              color: AppColors.darkGray,
              blurRadius: 0.0,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: _buildEventInfo(context, index, data),
            ),
            Container(
              height: double.infinity,
              width: 2.0,
              color: AppColors.secondaryColor,
            ),
            const SizedBox(width: 16.0),
            _buildEventDate(context, index, data)
          ],
        ),
      ),
    );
  }

  Column _buildEventDate(
      BuildContext context, int index, List<EventModel>? data) {
    final date = data?[index].startDate;
    String? dateDay;
    String? dateMonth;
    String? dateYear;

    if (date != null) {
      dateDay = ParseDate.returnDay(date);
      dateMonth = ParseDate.returnMonth(date).substring(0, 3);
      dateYear = ParseDate.returnYear(date);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dateMonth ?? '',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(dateDay ?? '', style: Theme.of(context).textTheme.headline6),
        Text(dateYear ?? '', style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }

  Column _buildEventInfo(
      BuildContext context, int index, List<EventModel>? data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data?[index].name ?? '',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.w700)),
        Row(
          children: [
            const Icon(
              Icons.pin_drop_rounded,
              size: 16.0,
            ),
            const SizedBox(width: AppSizes.baseSize),
            Text(data?[index].location ?? '',
                style: Theme.of(context).textTheme.bodyText2),
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
              '${data?[index].guestList?.length} Guest',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}
