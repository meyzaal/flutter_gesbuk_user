import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/features/event_detail/event_detail_controller.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/coming_soon_page.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/scaffold.dart';
import 'package:get/get.dart';

class EventDetailScreen extends GetView<EventDetailController> {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GesbukUserScaffold(
      body: ComingSoonPage(),
      backButton: true,
      appBarTitle: 'Detail Event',
    );
  }
}
