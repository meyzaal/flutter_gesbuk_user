import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/features/home/home_controller.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/coming_soon_page.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GesbukUserScaffold(
      body: ComingSoonPage(),
      bottomMenuIndex: 0,
    );
  }
}
