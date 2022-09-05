import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GesbukUserScaffold(
      appBarTitle: 'Event Saya',
      body: Center(
        child: Text('Event Screen'),
      ),
      bottomMenuIndex: 1,
    );
  }
}
