import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GesbukUserScaffold(
      appBarTitle: 'Profil',
      body: Center(
        child: Text('Product Screen'),
      ),
      bottomMenuIndex: 3,
    );
  }
}
