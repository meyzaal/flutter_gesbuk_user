import 'package:flutter_gesbuk_user/app/core/usecases.dart/param_use_case.dart';
import 'package:flutter_gesbuk_user/data/models/guest_model.dart';
import 'package:flutter_gesbuk_user/domain/repositories/guest_repository.dart';

class GuestCheckInUseCase extends ParamUseCase<GuestModel?, String> {
  final GuestRepository _guestRepository;

  GuestCheckInUseCase(this._guestRepository);

  @override
  Future<GuestModel?> execute(String params) async {
    return await _guestRepository.checkinGuest(params);
  }
}
