import 'package:flutter_gesbuk_user/data/providers/network/api_endpoint.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_provider.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_request_representable.dart';

class EventAPI implements APIRequestRepresentable {
  String? eventId;

  EventAPI._({this.eventId});

  EventAPI.getEvent();

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
  String get path => '/get-all-event-test';

  @override
  Map<String, String>? get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
