import 'package:flutter_gesbuk_user/domain/entities/user.dart';

class GesbukUserModel extends GesbukUser {
  GesbukUserModel({
    String? name,
    String? email,
    String? role,
    String? picture,
    String? id,
    String? phone,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) : super(
            name: name,
            email: email,
            role: role,
            picture: picture,
            id: id,
            phone: phone,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory GesbukUserModel.fromJson(Map<String, dynamic> json) => GesbukUserModel(
        name: json["name"],
        email: json["email"],
        role: json["role"],
        picture: json["picture"],
        id: json["_id"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "role": role,
        "picture": picture,
        "_id": id,
        "phone": phone,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
