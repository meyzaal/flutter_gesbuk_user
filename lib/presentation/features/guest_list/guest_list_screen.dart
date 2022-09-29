import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/features/guest_list/guest_list.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class GuestListScreen extends GetView<GuestListController> {
  const GuestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GesbukUserScaffold(
        appBarTitle: 'Daftar Tamu', body: ComingSoonPage());
  }
}
