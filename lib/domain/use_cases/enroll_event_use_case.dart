import 'package:flutter_gesbuk_user/app/core/usecases.dart/param_use_case.dart';
import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/domain/repositories/event_repository.dart';

class EnrollEventUseCase extends ParamUseCase<EventModel?, String> {
  final EventRepository _eventRepository;

  EnrollEventUseCase(this._eventRepository);

  @override
  Future<EventModel?> execute(String params) {
    return _eventRepository.enrollEvent(params);
  }
}
