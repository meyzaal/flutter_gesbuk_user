import 'package:flutter_gesbuk_user/domain/entities/guest.dart';

class GuestModel extends Guest {
  GuestModel({
    String? id,
    String? name,
    String? address,
    String? category,
    String? eventId,
    int? v,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? checkInTime,
    bool? isExpanded,
  }) : super(
            id: id,
            name: name,
            address: address,
            category: category,
            eventId: eventId,
            v: v,
            createdAt: createdAt,
            updatedAt: updatedAt,
            checkInTime: checkInTime,
            isExpanded: isExpanded);

  factory GuestModel.fromJson(Map<String, dynamic> json) => GuestModel(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        category: json["category"],
        eventId: json["eventId"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        checkInTime: json["checkInTime"] == null
            ? null
            : DateTime.parse(json["checkInTime"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "address": address,
        "category": category,
        "eventId": eventId,
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "checkInTime": checkInTime?.toIso8601String(),
      };
}
