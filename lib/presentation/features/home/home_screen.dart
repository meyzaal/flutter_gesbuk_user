import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/features/home/home_controller.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GesbukUserScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Home Screen'),
          ],
        ),
      ),
      bottomMenuIndex: 0,
    );
  }
}
