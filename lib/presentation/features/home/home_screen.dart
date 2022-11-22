import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event.dart';
import 'package:flutter_gesbuk_user/presentation/features/home/home_controller.dart';
import 'package:flutter_gesbuk_user/presentation/features/profile/profile.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find<ProfileController>();
    final EventController eventController = Get.find<EventController>();

    return GesbukUserScaffold(
      body: profileController.obx(
        (data) {
          return ListView(
            children: <Widget>[
              _buildAdvantages(context),
              const Divider(thickness: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Portfolio',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                        minHeight: 336.0, maxHeight: 376.0),
                    child: ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            controller.portfolio[index],
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8.0);
                        },
                        itemCount: controller.portfolio.length),
                  )
                ],
              )
            ],
          );

          // return NestedScrollView(
          //   headerSliverBuilder: (context, innerBoxIsScrolled) => [SizedBox()],
          //   body: ListView.separated(
          //       shrinkWrap: true,
          //       primary: false,
          //       // physics: const NeverScrollableScrollPhysics(),
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) =>
          //           SizedBox(width: 300.0, child: controller.portfolio[index]),
          //       separatorBuilder: (context, index) => SizedBox(width: 8.0),
          //       itemCount: controller.portfolio.length),
          // );
        },
        onLoading: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onEmpty: const Center(
          child: Text('Data kosong'),
        ),
        onError: (error) => Center(
          child: Text(error.toString()),
        ),
      ),
      bottomMenuIndex: 0,
    );
  }

  _buildAdvantages(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Advantages',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16.0),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    autoPlayInterval: const Duration(seconds: 5),
                    scrollDirection: Axis.vertical)),
          ),
        ],
      ),
    );
  }
}
