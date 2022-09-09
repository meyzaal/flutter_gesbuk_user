import 'package:flutter_gesbuk_user/data/models/event_model.dart';

abstract class EventRepository {
  Future<List<EventModel>?> getEvent();
  Future<EventModel?> getEventById(String eventId);
}
