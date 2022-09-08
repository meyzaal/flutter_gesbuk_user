import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/data/models/event_response_model.dart';
import 'package:flutter_gesbuk_user/data/providers/network/apis/event_api.dart';
import 'package:flutter_gesbuk_user/domain/repositories/event_repository.dart';

class EventRepositoryIml extends EventRepository {
  @override
  Future<List<EventModel>?> getEvent() async {
    final response = await EventAPI.getEvent().request();
    return EventResponseModel.fromJson(response).data;
  }
}
