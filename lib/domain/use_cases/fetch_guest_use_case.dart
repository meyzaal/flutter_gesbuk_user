import 'package:flutter_gesbuk_user/app/core/usecases.dart/param_use_case.dart';
import 'package:flutter_gesbuk_user/app/utils/typedef.dart';
import 'package:flutter_gesbuk_user/data/models/guest_response_model.dart';
import 'package:flutter_gesbuk_user/domain/repositories/guest_repository.dart';
import 'package:tuple/tuple.dart';

class FetchGuestUseCase
    extends ParamUseCase<GuestResponseModel?, Tuple2<String, JSON?>> {
  final GuestRepository _guestRepository;

  FetchGuestUseCase(this._guestRepository);

  @override
  Future<GuestResponseModel?> execute(Tuple2 params) async {
    return await _guestRepository.fetchGuest(params.item1, params.item2);
  }
}
