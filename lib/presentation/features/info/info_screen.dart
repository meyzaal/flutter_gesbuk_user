import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String appVersion = Get.arguments;
    return GesbukUserScaffold(
      backButton: true,
      appBarTitle: 'Tentang Gesbuk',
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Gesbuk Mobile Application',
                style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 16.0),
            Text('version',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.black38)),
            Text(appVersion, style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 16.0),
            Text(
                'Gesbuk dan logo Gesbuk merupakan merek dagang Gesbuk. Hak Cipta dilindungi undang-undang.',
                style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(height: 8.0),
            Text(
                'Gesbuk dibuat menggunakan perangkat lunak sumber terbuka Flutter.',
                style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 0)),
              child: const Text('Ketentuan Layanan'),
            ),
            const SizedBox(height: 16.0),
            Text('author',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.black38)),
            Text('Meyza Ulil Albab',
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 24.0),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'All illustration by',
                  style: Theme.of(context).textTheme.bodyText2),
              TextSpan(
                  text: ' unDraw',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontFamily: 'GlacialIndifference'))
            ])),
            // const SizedBox(height: 8.0),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'All images by',
                  style: Theme.of(context).textTheme.bodyText2),
              TextSpan(
                  text: ' Unsplash',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontFamily: 'UnB'))
            ])),
          ],
        ),
      ),
    );
  }
}
