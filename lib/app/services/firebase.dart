import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gesbuk_user/app/config/firebase_options.dart';
import 'package:flutter_gesbuk_user/app/extensions/compare_time.dart';
import 'package:flutter_gesbuk_user/app/services/local_storage.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  final LocalStorageService _storage = Get.find<LocalStorageService>();

  Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    debugPrint('firebase init');

    return this;
  }

  Future<String?> getFirebaseToken() async {
    debugPrint('get firebase token running');
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? timeStorage = _storage.tokenTime;
    String? tokenStorage = _storage.token;
    DateTime? time;

    timeStorage != null ? time = DateTime.parse(timeStorage) : null;

    if (user == null) return null;

    if (tokenStorage == null) {
      return await user.getIdToken().then((value) async {
        _storage.token = value;
        _storage.tokenTime = DateTime.now().toIso8601String();

        debugPrint('get and save token to local storage');
        return value;
      });
    }

    if (time != null) {
      final isExpired = compareTime(time, 50);
      if (!isExpired) {
        debugPrint('get current token');
        return tokenStorage;
      }
    }

    return await user.getIdToken().then((value) async {
      _storage.token = value;
      _storage.tokenTime = DateTime.now().toIso8601String();

      debugPrint('get and set fresh token');
      return value;
    });
  }
}
