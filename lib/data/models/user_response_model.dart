import 'package:flutter_gesbuk_user/data/models/user_model.dart';

class GesbukUserResponseModel {
  GesbukUserResponseModel({
    this.message,
    this.data,
  });

  String? message;
  GesbukUserModel? data;

  factory GesbukUserResponseModel.fromJson(Map<String, dynamic> json) =>
      GesbukUserResponseModel(
        message: json["message"],
        data: GesbukUserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}
