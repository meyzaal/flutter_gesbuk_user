import 'package:flutter_gesbuk_user/app/core/usecases.dart/param_use_case.dart';
import 'package:flutter_gesbuk_user/data/models/guest_model.dart';
import 'package:flutter_gesbuk_user/domain/repositories/guest_repository.dart';
import 'package:tuple/tuple.dart';

class UploadPhotoGuestUseCase
    extends ParamUseCase<GuestModel?, Tuple2<String, dynamic>> {
  final GuestRepository _guestRepository;

  UploadPhotoGuestUseCase(this._guestRepository);

  @override
  Future<GuestModel?> execute(Tuple2 params) {
    return _guestRepository.uploadPhoto(params.item1, params.item2);
  }
}
