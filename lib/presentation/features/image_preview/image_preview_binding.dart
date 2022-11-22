import 'package:flutter_gesbuk_user/data/repository/guest_repository.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/upload_photo_guest_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/features/image_preview/image_preview_controller.dart';
import 'package:get/get.dart';

class ImagePreviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestRepositoryIml());
    Get.lazyPut(() => UploadPhotoGuestUseCase(Get.find<GuestRepositoryIml>()));
    Get.lazyPut(
        () => ImagePreviewController(Get.find<UploadPhotoGuestUseCase>()));
  }
}
