import 'package:flutter_gesbuk_user/app/core/usecases.dart/param_use_case.dart';
import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/domain/repositories/event_repository.dart';

class FetchEventDetailUseCase extends ParamUseCase<EventModel?, String> {
  final EventRepository _eventRepository;

  FetchEventDetailUseCase(this._eventRepository);

  @override
  Future<EventModel?> execute(String params) {
    return _eventRepository.getEventById(params);
  }
}
