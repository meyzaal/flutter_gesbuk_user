import 'package:flutter_gesbuk_user/data/models/guest_response_model.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_endpoint.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_provider.dart';
import 'package:flutter_gesbuk_user/data/providers/network/api_request_representable.dart';

class GuestAPI implements APIRequestRepresentable {
  final GuestEndpoint guestEndpoint;

  String? guestId;
  String? eventId;
  Map<String, String>? guestQuery;

  GuestAPI._(
      {required this.guestEndpoint,
      this.guestId,
      this.eventId,
      this.guestQuery});

  GuestAPI.checkinGuest(String guestId)
      : this._(guestEndpoint: GuestEndpoint.checkin, guestId: guestId);

  GuestAPI.fetchGuest(String eventId, Map<String, String>? guestQuery)
      : this._(
            guestEndpoint: GuestEndpoint.fetchGuest,
            eventId: eventId,
            guestQuery: guestQuery);

  @override
  get body {
    switch (guestEndpoint) {
      case GuestEndpoint.checkin:
        return {'checkInTime': DateTime.now().toIso8601String()};

      default:
        null;
    }
  }

  @override
  String get endpoint => APIEndpoint.guest;

  @override
  HTTPMethod get method {
    switch (guestEndpoint) {
      case GuestEndpoint.checkin:
        return HTTPMethod.patch;
      case GuestEndpoint.fetchGuest:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (guestEndpoint) {
      case GuestEndpoint.checkin:
        return '/check-in/$guestId';
      case GuestEndpoint.fetchGuest:
        return '/from-event/$eventId';
    }
  }

  @override
  Map<String, String>? get query {
    switch (guestEndpoint) {
      case GuestEndpoint.fetchGuest:
        return guestQuery;
      default:
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
