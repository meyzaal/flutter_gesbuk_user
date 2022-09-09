import 'package:flutter_gesbuk_user/data/providers/network/api_endpoint.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_provider.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_request_representable.dart';

enum EventEndpoint { allEvent, eventById }

class EventAPI implements APIRequestRepresentable {
  final EventEndpoint eventEnpoint;
  String? eventId;

  EventAPI._({required this.eventEnpoint, this.eventId});

  EventAPI.getEvent() : this._(eventEnpoint: EventEndpoint.allEvent);
  EventAPI.getEventById(String eventId)
      : this._(eventEnpoint: EventEndpoint.eventById, eventId: eventId);

  @override
  get body => null;

  @override
  String get endpoint => APIEndpoint.event;

  @override
  Map<String, String>? get headers => null;

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  String get path {
    switch (eventEnpoint) {
      case EventEndpoint.allEvent:
        return '/get-all-event-test';
      case EventEndpoint.eventById:
        return '/$eventId';
    }
  }

  @override
  Map<String, String>? get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
