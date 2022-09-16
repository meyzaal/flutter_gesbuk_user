import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/coming_soon_page.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/scaffold.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GesbukUserScaffold(
      appBarTitle: 'Edit Profil',
      backButton: true,
      body: ComingSoonPage(),
    );
  }
}
