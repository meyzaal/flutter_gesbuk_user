import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('assets/images/undraw_under_construction_-46-pa.svg',
              width: MediaQuery.of(context).size.width),
          const SizedBox(height: 8.0),
          Text('Feature not yet available',
              style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }
}
