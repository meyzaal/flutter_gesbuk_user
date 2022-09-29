import 'package:flutter_gesbuk_user/data/models/user_model.dart';

abstract class AuthRepository {
  Future<GesbukUserModel?> signIn();
  Future<GesbukUserModel?> getUserInfo();
}
