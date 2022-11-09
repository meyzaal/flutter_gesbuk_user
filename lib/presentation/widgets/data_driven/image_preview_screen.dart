import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    XFile image = Get.arguments;
    return GesbukUserScaffold(
      scaffoldBackgroundColor: AppColors.black,
      blankAppBar: true,
      bottomNavBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        color: AppColors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: GesbukUserPrimaryButtonIcon(
                label: 'Kirim',
                onPressed: () => Get.back(),
                isImageIcon: false,
                icon: Icons.upload,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: GesbukUserSecondaryButtonIcon(
                label: 'Batal',
                onPressed: () => Get.back(),
                icon: Icons.close,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: FadeInImage(
            placeholder:
                const AssetImage('assets/images/image_placeholder.png'),
            image: FileImage(File(image.path))),
      ),
    );
  }
}
