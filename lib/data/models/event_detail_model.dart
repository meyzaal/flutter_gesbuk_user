import 'package:flutter_gesbuk_user/data/models/guest_model.dart';
import 'package:flutter_gesbuk_user/domain/entities/event_detail.dart';

class EventDetailModel extends EventDetail {
  EventDetailModel({
    String? id,
    String? name,
    String? imageUrl,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    String? key,
    bool? isEnrolled,
    String? eventType,
    List<GuestModel>? guestList,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? userId,
  }) : super(
            id: id,
            name: name,
            imageUrl: imageUrl,
            location: location,
            startDate: startDate,
            endDate: endDate,
            key: key,
            isEnrolled: isEnrolled,
            eventType: eventType,
            guestList: guestList,
            createdAt: createdAt,
            updatedAt: updatedAt,
            v: v,
            userId: userId);

  factory EventDetailModel.fromJson(Map<String, dynamic> json) =>
      EventDetailModel(
        id: json["_id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        location: json["location"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        key: json["key"],
        isEnrolled: json["isEnrolled"],
        eventType: json["eventType"],
        guestList: List<GuestModel>.from(
            json["guestList"].map((x) => GuestModel.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "imageUrl": imageUrl,
        "location": location,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "key": key,
        "isEnrolled": isEnrolled,
        "eventType": eventType,
        "guestList":
            List<dynamic>.from(guestList?.map((x) => x.toJson()) ?? []),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "userId": userId,
      };
}
