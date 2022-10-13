import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    XFile image = Get.arguments;
    return GesbukUserScaffold(
      blankAppBar: true,
      bottomNavBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GesbukUserSecondaryButtonIcon(
              isExpand: false,
              label: 'Batal',
              onPressed: () => Get.back(),
              icon: Icons.close,
            ),
            const SizedBox(width: 16.0),
            GesbukUserPrimaryButtonIcon(
              isExpand: false,
              label: 'Kirim',
              onPressed: () => Get.back(),
              isImageIcon: false,
              icon: Icons.upload,
            )
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
