import 'package:flutter_gesbuk_user/data/models/event_detail_model.dart';
import 'package:flutter_gesbuk_user/data/models/event_model.dart';

abstract class EventRepository {
  Future<List<EventModel>?> getEvent();
  Future<EventDetailModel?> getEventById(String eventId);
  Future<EventModel?> enrollEvent(String eventKey);
}
