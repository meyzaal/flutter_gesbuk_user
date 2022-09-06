import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/independent/primary_button_icon.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GesbukUserScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Home Screen'),
          ],
        ),
      ),
      bottomMenuIndex: 0,
    );
  }
}
