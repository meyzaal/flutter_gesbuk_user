import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/features/image_preview/image_preview.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePreviewScreen extends GetView<ImagePreviewController> {
  const ImagePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    XFile image = Get.arguments[0];
    String id = Get.arguments[1];
    FileImage fileImage = FileImage(File(image.path));
    precacheImage(fileImage, context);

    return GesbukUserScaffold(
      appBarTitle: 'Pratinjau Foto',
      backButton: true,
      bottomNavBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Obx(
              () => controller.isLoading.value
                  ? GesbukUserPrimaryButtonIcon(
                      label: 'Mengirim...',
                      onPressed: () {},
                      isImageIcon: false,
                      child: const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator.adaptive(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )),
                    )
                  : GesbukUserPrimaryButtonIcon(
                      label: 'Kirim',
                      onPressed: () => controller.uploadPhotoGuest(image, id),
                      isImageIcon: false,
                      icon: Icons.upload,
                    ),
            )),
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
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            child: Image(image: fileImage)),
      )),
    );
  }
}
