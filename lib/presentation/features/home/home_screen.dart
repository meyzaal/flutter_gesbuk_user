import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GesbukUserScaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('Home Screen'),
        ),
      ),
      bottomMenuIndex: 0,
    );
  }
}
