import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';

class CardAdvantages extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CardAdvantages({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 8.0,
      isThreeLine: true,
      leading: Icon(
        icon,
        color: AppColors.mainColor,
      ),
      title: Text(
        // 'Efisiensi Waktu',
        title,
        style: Theme.of(context).textTheme.subtitle2,
      ),
      subtitle: Text(
          // 'Registrasi cepat hanya membutuhkan waktu 5 detik per-orang',
          subtitle,
          style: Theme.of(context).textTheme.bodyText2),
    );
  }
}
