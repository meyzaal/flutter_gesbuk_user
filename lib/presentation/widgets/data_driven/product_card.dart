import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/currency_formatter.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String category;
  final String limit;
  final int price;
  const ProductCard({
    Key? key,
    required this.category,
    required this.limit,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final finalPrice = price - (price * 0.3);
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.bottomLeft,
            width: Get.width,
            height: 80.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background-$category.png'),
                    fit: BoxFit.cover)),
            child: Text(
              category.toUpperCase(),
              style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w800,
                  color: AppColors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.discount_rounded,
                      size: 16.0,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '30% Off',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      formatCurrency.format(price),
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                  ],
                ),
                Text(formatCurrency.format(finalPrice),
                    style: Theme.of(context).textTheme.subtitle1),
                const Divider(),
                Text(
                  'Detail',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 8.0),
                Text(
                    '$limit person guest\nDigital invitation card ${limit}pcs'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
