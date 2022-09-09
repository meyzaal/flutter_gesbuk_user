import 'package:flutter_gesbuk_user/data/models/event_model.dart';

class EventDetailResponseModel {
  EventDetailResponseModel({
    this.message,
    this.data,
  });

  String? message;
  EventModel? data;

  factory EventDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      EventDetailResponseModel(
        message: json["message"],
        data: EventModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}
