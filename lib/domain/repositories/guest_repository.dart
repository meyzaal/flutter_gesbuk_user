import 'package:flutter_gesbuk_user/data/models/guest_model.dart';
import 'package:flutter_gesbuk_user/data/models/guest_response_model.dart';

abstract class GuestRepository {
  Future<GuestModel?> checkinGuest(String guestId);
  Future<GuestResponseModel?> fetchGuest(
      String eventId, Map<String, String>? guestQuery);
}
