import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launch(Uri url, BuildContext context) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    GesbukUserSnackBar.showSnackBar(
        context, 'Could not launch $url', Colors.red.shade400, 'tutup');
  }
}
