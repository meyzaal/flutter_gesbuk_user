import 'dart:math' as math;
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
