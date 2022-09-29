import 'package:flutter_gesbuk_user/app/core/usecases.dart/no_param_use_case.dart';
import 'package:flutter_gesbuk_user/data/models/user_model.dart';
import 'package:flutter_gesbuk_user/domain/repositories/auth_repository.dart';

class FetchUserUseCase extends NoParamUseCase<GesbukUserModel?> {
  final AuthRepository _authRepository;

  FetchUserUseCase(this._authRepository);

  @override
  Future<GesbukUserModel?> execute() {
    return _authRepository.getUserInfo();
  }
}
