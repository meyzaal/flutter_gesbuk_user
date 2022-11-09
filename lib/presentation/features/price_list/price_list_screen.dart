import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/currency_formatter.dart';
import 'package:flutter_gesbuk_user/app/extensions/launch_url.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/features/price_list/price_list.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class PriceListScreen extends GetView<PriceListController> {
  const PriceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return GesbukUserScaffold(
      appBarTitle: 'Price List',
      backButton: false,
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) => controller.items[index],
        itemCount: controller.items.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 8.0),
      ),
      bottomMenuIndex: 2,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () async => await launch(controller.url, context),
        tooltip: 'Hubungi admin',
        child: const Icon(Icons.whatsapp),
      ),
    );
  }
}


