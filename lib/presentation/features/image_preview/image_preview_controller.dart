import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/mime_type.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/upload_photo_guest_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/guest_list/guest_list.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:tuple/tuple.dart';

class ImagePreviewController extends GetxController {
  final UploadPhotoGuestUseCase _uploadPhotoGuestUseCase;

  ImagePreviewController(this._uploadPhotoGuestUseCase);

  final GuestListController _guestListController =
      Get.find<GuestListController>();
  final RxBool isLoading = false.obs;

  uploadPhotoGuest(XFile image, String id) async {
    try {
      isLoading.value = true;
      var body = FormData({
        'uploadFile': MultipartFile(image.path,
            filename: basename(image.path), contentType: mimeType(image.path))
      });
      await _uploadPhotoGuestUseCase.execute(Tuple2(id, body));
      _guestListController.isSuccessUploadImage.value = true;
      isLoading.value = false;
      Get.back();
    } catch (e) {
      isLoading.value = false;
      final context = Get.context!;
      GesbukUserSnackBar.showSnackBar(
          context, '$e', Colors.red.shade400, 'Tutup');
    }
  }
}
