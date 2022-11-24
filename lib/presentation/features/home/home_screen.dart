import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event.dart';
import 'package:flutter_gesbuk_user/presentation/features/home/home_controller.dart';
import 'package:flutter_gesbuk_user/presentation/features/profile/profile.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/data_driven/event_card.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find<ProfileController>();
    final EventController eventController = Get.find<EventController>();

    return GesbukUserScaffold(
      safeAreaColor: AppColors.mainColor,
      body: ListView(
        children: <Widget>[
          _buildHeader(profileController, context),
          _buildAdvantages(context),
          _buildUpcomingEvents(context),
          const Divider(thickness: 8.0),
          _buildPortfolio(context)
        ],
      ),
      bottomMenuIndex: 0,
    );
  }

  _buildUpcomingEvents(BuildContext context) {
    return controller.obx(
      (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Divider(thickness: 8.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Event mendatang',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            height: AppSizes.baseSize * 32,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () =>
                    Get.toNamed('/event_detail', arguments: data?[index].id),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppSizes.widgetSidePadding),
                  ),
                  height: AppSizes.baseSize * 32,
                  width: MediaQuery.of(context).size.width - 32,
                  child: EventCard(
                    index: index,
                    data: data,
                    withBorderRadius: false,
                  ),
                ),
              ),
              itemCount: data?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 0.0),
            ),
          ),
        ],
      ),
      onLoading: const SizedBox(),
      onEmpty: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(thickness: 8.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () => Text(
                controller.notHaveEvent.value
                    ? 'Buat event yuk!'
                    : 'Buat event lagi',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Obx(
            () => controller.notHaveEvent.value
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                    child: GesbukUserPrimaryButtonIcon(
                      label: 'Buat Event',
                      onPressed: () => Get.toNamed('/my_event'),
                      isImageIcon: false,
                      icon: Icons.add_rounded,
                    ),
                  )
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSizes.sidePadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/images/undraw_celebration_re_kc9k.svg',
                            height: AppSizes.baseSize * 16,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                              'Event sebelumnya sukses besar! yuk buat event lagi dengan Gesbuk!',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
      onError: (error) => Text(error.toString()),
    );
  }

  Column _buildPortfolio(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Portofolio Gesbuk',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 336.0, maxHeight: 376.0),
          child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => controller.portfolio[index],
              separatorBuilder: (context, index) {
                return const SizedBox(width: 8.0);
              },
              itemCount: controller.portfolio.length),
        )
      ],
    );
  }

  Stack _buildHeader(ProfileController controller, BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/bg-header.png'),
        controller.obx(
          (data) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListTile(
                title: Text(
                  'Hello!',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.white),
                ),
                subtitle: Text(data?.name ?? 'Stranger',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.white)),
                trailing: CircleAvatar(
                  backgroundColor: AppColors.background,
                  radius: 24.0,
                  child: CircleAvatar(
                    radius: 23.0,
                    backgroundImage: data?.picture != null
                        ? NetworkImage(data!.picture!)
                        : null,
                  ),
                ),
              ),
            );
          },
          onLoading: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ShimmerLoading(
                          width: 32.0,
                          height:
                              Theme.of(context).textTheme.titleSmall?.fontSize,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ShimmerLoading(
                              width: 96.0,
                              height: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.fontSize),
                        ),
                      ],
                    ),
                  ),
                  const ShimmerLoading(
                    type: ShimmerType.circle,
                    radius: 24.0,
                  ),
                ],
              )),
          onEmpty: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ListTile(
              title: Text(
                'Hello!',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.white),
              ),
              subtitle: Text('Stranger',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.white)),
              trailing: const CircleAvatar(
                radius: 24.0,
                backgroundImage:
                    AssetImage('assets/images/profile_placeholder.jpg'),
              ),
            ),
          ),
          onError: (error) => Center(
            child: Text(error.toString()),
          ),
        ),
      ],
    );
  }

  _buildAdvantages(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.hardEdge,
        child: CarouselSlider.builder(
            itemCount: controller.advantages.length,
            itemBuilder: (context, index, realIndex) =>
                Center(child: controller.advantages[index]),
            options: CarouselOptions(
                viewportFraction: 1.0,
                height: 88.0,
                reverse: true,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                autoPlayInterval: const Duration(seconds: 5),
                scrollDirection: Axis.vertical)),
      ),
    );
  }
}
