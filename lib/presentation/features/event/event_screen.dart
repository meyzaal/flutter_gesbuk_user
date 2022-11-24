import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/date.dart';
import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/data_driven/event_card.dart';
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
              physics: const AlwaysScrollableScrollPhysics(),
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
                                    child: EventCard(
                                      index: index,
                                      data: data,
                                      withBorderRadius: true,
                                    ));
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
                    onError: (error) => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSizes.sidePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/undraw_Page_not_found_re_e9o6.png',
                              height: AppSizes.baseSize * 16,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.center,
                            child: Text('Sepertinya ada masalah.',
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
}
