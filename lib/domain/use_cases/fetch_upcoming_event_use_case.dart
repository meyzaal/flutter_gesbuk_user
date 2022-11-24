import 'package:flutter_gesbuk_user/app/core/usecases.dart/no_param_use_case.dart';
import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/domain/repositories/event_repository.dart';

class FetchUpcomingEventUseCase extends NoParamUseCase<List<EventModel>?> {
  final EventRepository _eventRepository;

  FetchUpcomingEventUseCase(this._eventRepository);

  @override
  Future<List<EventModel>?> execute() {
    return _eventRepository.upcomingEvent();
  }
}
