import 'package:flutter_gesbuk_user/data/models/guest_model.dart';

class EventDetail {
  EventDetail({
    this.id,
        this.name,
        this.imageUrl,
        this.location,
        this.startDate,
        this.endDate,
        this.key,
        this.isEnrolled,
        this.eventType,
        this.guestList,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.userId,
  });

  String? id;
    String? name;
    String? imageUrl;
    String? location;
    DateTime? startDate;
    DateTime? endDate;
    String? key;
    bool? isEnrolled;
    String? eventType;
    List<GuestModel>? guestList;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? userId;
}
