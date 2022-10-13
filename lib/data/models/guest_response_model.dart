import 'package:flutter_gesbuk_user/data/models/guest_model.dart';

enum GuestEndpoint { checkin, fetchGuest }

class GuestResponseModel {
  GuestResponseModel({
    this.message,
    this.data,
    this.listData,
    this.totalPages,
    this.totalResults,
    this.currentPage,
  });

  String? message;
  GuestModel? data;
  List<GuestModel>? listData;
  int? totalPages;
  int? totalResults;
  int? currentPage;

  factory GuestResponseModel.fromJson(
      Map<String, dynamic> json, GuestEndpoint guestEndpoint) {
    switch (guestEndpoint) {
      case GuestEndpoint.checkin:
        return GuestResponseModel(
            message: json["message"], data: GuestModel.fromJson(json["data"]));
      case GuestEndpoint.fetchGuest:
        return GuestResponseModel(
          message: json["message"],
          listData: List<GuestModel>.from(
            json["data"].map(
              (x) => GuestModel.fromJson(x),
            ),
          ),
          totalPages: json["totalPages"],
          totalResults: json["totalResults"],
          currentPage: json["currentPage"],
        );
      default:
        throw Exception('error at models');
    }
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
        "totalPages": totalPages,
        "currentPage": currentPage,
        "totalResults": totalResults,
      };
}
