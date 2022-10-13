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
          return const ComingSoonPage();
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
}
