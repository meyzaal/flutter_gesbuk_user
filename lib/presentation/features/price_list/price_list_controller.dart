import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class PriceListController extends GetxController {
  final url = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: '/6281381607668',
      queryParameters: {'text': 'Halo admin'});

  List<ProductCard> items = [
    const ProductCard(category: 'bronze', limit: '300', price: 1500000),
    const ProductCard(category: 'silver', limit: '400', price: 1700000),
    const ProductCard(category: 'gold', limit: '600', price: 2000000),
  ];
}
