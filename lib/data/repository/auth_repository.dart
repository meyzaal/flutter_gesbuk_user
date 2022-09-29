import 'package:flutter_gesbuk_user/data/models/user_model.dart';
import 'package:flutter_gesbuk_user/data/models/user_response_model.dart';
import 'package:flutter_gesbuk_user/data/providers/network/apis/auth_api.dart';
import 'package:flutter_gesbuk_user/domain/repositories/auth_repository.dart';

class AuthRepositoryIml extends AuthRepository {
  @override
  Future<GesbukUserModel?> signIn() async {
    final response = await AuthAPI.signIn().request();
    return GesbukUserResponseModel.fromJson(response).data;
  }

  @override
  Future<GesbukUserModel?> getUserInfo() async {
    final response = await AuthAPI.getUserInfo().request();
    return GesbukUserResponseModel.fromJson(response).data;
  }
}
