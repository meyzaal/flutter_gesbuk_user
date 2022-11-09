import 'package:flutter_gesbuk_user/data/providers/network/api_endpoint.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_provider.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_request_representable.dart';

enum EventEndpoint { userEvent, byEventId, enrollEvent }

class EventAPI implements APIRequestRepresentable {
  final EventEndpoint eventEnpoint;

  String? eventId;
  String? eventKey;

  EventAPI._({required this.eventEnpoint, this.eventId, this.eventKey});

  EventAPI.getEvent() : this._(eventEnpoint: EventEndpoint.userEvent);
  EventAPI.getEventByEventId(String eventId)
      : this._(
          eventEnpoint: EventEndpoint.byEventId,
          eventId: eventId,
        );
  EventAPI.enrollEvent(String eventKey)
      : this._(eventEnpoint: EventEndpoint.enrollEvent, eventKey: eventKey);

  @override
  get body => null;

  @override
  String get endpoint => APIEndpoint.event;

  @override
  HTTPMethod get method {
    if (eventEnpoint == EventEndpoint.enrollEvent) {
      return HTTPMethod.put;
    } else {
      return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (eventEnpoint) {
      case EventEndpoint.userEvent:
        return '';
      case EventEndpoint.byEventId:
        return '/$eventId';
      case EventEndpoint.enrollEvent:
        return '/add-user';
    }
  }

  @override
  Map<String, String>? get query {
    if (eventEnpoint == EventEndpoint.enrollEvent) {
      return {"key": eventKey!};
    } else {
      return null;
    }
  }

  @override
  Future request() => APIProvider.instance.request(this);

  @override
  String get url => endpoint + path;
  
  @override
  bool get requiresAuthToken => true;
}
