import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key { token, tokenTime, isDismissPhone }

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  String? get token => _sharedPreferences?.getString(_Key.token.toString());
  String? get tokenTime =>
      _sharedPreferences?.getString(_Key.tokenTime.toString());
  bool? get isDismissPhone =>
      _sharedPreferences?.getBool(_Key.isDismissPhone.toString());

  set token(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.token.toString(), value);
    } else {
      _sharedPreferences?.remove(_Key.token.toString());
    }
  }

  set tokenTime(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.tokenTime.toString(), value);
    } else {
      _sharedPreferences?.remove(_Key.tokenTime.toString());
    }
  }

  set isDismissPhone(bool? value) {
    if (value != null) {
      _sharedPreferences?.setBool(_Key.isDismissPhone.toString(), value);
    } else {
      _sharedPreferences?.remove(_Key.isDismissPhone.toString());
    }
  }
}
