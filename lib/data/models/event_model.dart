import 'package:flutter_gesbuk_user/domain/entities/event.dart';

class EventModel extends Event {
  EventModel({
    String? id,
    String? name,
    String? imageUrl,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    String? key,
    bool? isEnrolled,
    String? eventType,
    List<String>? guestList,
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

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["_id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        location: json["location"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        key: json["key"],
        isEnrolled: json["isEnrolled"],
        eventType: json["eventType"],
        guestList: List<String>.from(json["guestList"].map((x) => x)),
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
        "guestList": List<String>.from(guestList?.map((x) => x) ?? []),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "userId": userId,
      };
}
