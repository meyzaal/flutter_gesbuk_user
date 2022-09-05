import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class PriceListScreen extends StatelessWidget {
  const PriceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GesbukUserScaffold(
      appBarTitle: 'Price List',
      backButton: false,
      body: Center(
        child: Text('Price List Screen'),
      ),
      bottomMenuIndex: 2,
    );
  }
}
