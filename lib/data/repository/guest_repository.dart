
import 'package:flutter_gesbuk_user/data/models/guest_model.dart';
import 'package:flutter_gesbuk_user/data/models/guest_response_model.dart';
import 'package:flutter_gesbuk_user/data/providers/network/apis/guest_api.dart';
import 'package:flutter_gesbuk_user/domain/repositories/guest_repository.dart';

class GuestRepositoryIml extends GuestRepository {
  @override
  Future<GuestModel?> checkinGuest(String guestId) async {
    final response = await GuestAPI.checkinGuest(guestId).request();

    return GuestResponseModel.fromJson(response, GuestEndpoint.checkin).data;
  }

  @override
  Future<GuestResponseModel?> fetchGuest(
      String eventId, Map<String, String>? guestQuery) async {
    final response = await GuestAPI.fetchGuest(eventId, guestQuery).request();

    return GuestResponseModel.fromJson(response, GuestEndpoint.fetchGuest);
  }

  @override
  Future<GuestModel?> uploadPhoto(String guestId, dynamic body) async {
    final response = await GuestAPI.uploadPhoto(guestId, body).request();
    return GuestResponseModel.fromJson(response, GuestEndpoint.uploadPhoto)
        .data;
  }
}
