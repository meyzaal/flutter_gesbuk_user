import 'package:flutter_gesbuk_user/data/models/event_detail_model.dart';

class EventDetailResponseModel {
  EventDetailResponseModel({
    this.message,
    this.data,
  });

  String? message;
  EventDetailModel? data;

  factory EventDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      EventDetailResponseModel(
        message: json["message"],
        data: EventDetailModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}
