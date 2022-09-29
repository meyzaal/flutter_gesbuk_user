import 'package:flutter_gesbuk_user/data/models/event_model.dart';
import 'package:flutter_gesbuk_user/data/providers/network/apis/event_api.dart';

class EventResponseModel {
  EventResponseModel({
    this.message,
    this.data,
    this.listData,
  });

  String? message;
  List<EventModel>? listData;
  EventModel? data;

  factory EventResponseModel.fromJson(
      Map<String, dynamic> json, EventEndpoint endpoint) {
    switch (endpoint) {
      case EventEndpoint.userEvent:
        return EventResponseModel(
          message: json["message"],
          listData: List<EventModel>.from(
              json["data"].map((x) => EventModel.fromJson(x))),
        );
      case EventEndpoint.enrollEvent:
        return EventResponseModel(
          message: json["message"],
          data: EventModel.fromJson(json["data"]),
        );
      default:
        throw Exception('error at models');
    }
  }

  // Map<String, dynamic> toJson() {
  //   switch (endpo) {
  //     case value:

  //       break;
  //     default:
  //   }
  //   return {
  //       "message": message,
  //       "data": List<dynamic>.from(listData?.map((x) => x.toJson()) ?? []),
  //     };
  // }
}
