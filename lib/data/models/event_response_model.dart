import 'package:flutter_gesbuk_user/data/models/event_model.dart';

class EventResponseModel {
  EventResponseModel({
    this.message,
    this.data,
  });

  String? message;
  List<EventModel>? data;

  factory EventResponseModel.fromJson(Map<String, dynamic> json) =>
      EventResponseModel(
        message: json["message"],
        data: List<EventModel>.from(
            json["data"].map((x) => EventModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}
