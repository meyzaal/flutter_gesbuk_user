// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/services/local_storage.dart';
import 'package:flutter_gesbuk_user/data/models/user_model.dart';
import 'package:flutter_gesbuk_user/domain/use_cases/sign_in_use_case.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthController extends GetxController with StateMixin<GesbukUserModel?> {
  final LocalStorageService storage = Get.find<LocalStorageService>();
  final SignInUseCase _signInUseCase = Get.find<SignInUseCase>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final context = Get.context!;

  PackageInfo? packageInfo;

  RxInt indicatorIndex = 0.obs;
  RxString appVersion = ''.obs;

  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      change(null, status: RxStatus.loading());

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await _firebaseAuth.signInWithCredential(credential);

      final user = _firebaseAuth.currentUser;

      if (user != null) {
        // Get id token
        String? token = await user.getIdToken();

        storage.token = token;

        // Print firebase token for testing postman
        print('===========FIREBASE TOKEN START===========');
        while (token!.isNotEmpty) {
          int initLength = (token.length >= 500 ? 500 : token.length);
          print(token.substring(0, initLength));
          int endLength = token.length;
          token = token.substring(initLength, endLength);
        }
        print('===========FIREBASE TOKEN END===========');

        // backend validation
        final result = await _signInUseCase.execute();

        if (result != null) {
          change(null, status: RxStatus.success());

          Get.offNamed('/home');
        }
      }
    } on FirebaseAuthException catch (firebaseError) {
      
      signOut(error: firebaseError.toString());
    } catch (error) {
      // error dismiss google account
      if (error.toString().contains(
          "Failed assertion: line 43 pos 12: 'accessToken != null || idToken != null': At least one of ID token and access token is required")) {
        change(null, status: RxStatus.success());
        return;
      }

      signOut(error: error.toString());
    }
  }

  signOut({String? error}) {
    try {
      if (error != null) {
        GesbukUserSnackBar.showSnackBar(
            context, error, Colors.red.shade400, 'tutup');
      }

      // remove auth
      _firebaseAuth.signOut();
      _googleSignIn.signOut();

      // remove storage
      storage.token = null;

      // route to login page
      Get.offAllNamed('/login');
    } catch (error) {
      GesbukUserSnackBar.showSnackBar(
          context, error.toString(), Colors.red.shade400, 'tutup');
    }
  }

  getIndex(int i) {
    indicatorIndex.value = i;
  }

  getPackageInfo() async {
    try {
      await PackageInfo.fromPlatform()
          .then((value) => appVersion.value = value.version);
    } catch (e) {
      print(e.toString());
    }
  }

  setFreshToken() async {
    final User? user = _firebaseAuth.currentUser;

    if (user != null) {
      final String freshToken = await user.getIdToken();

      storage.token = freshToken;
    } else {
      signOut(error: 'Sesi anda sudah habis');
    }
  }

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    getPackageInfo();
    super.onInit();
  }

  // DateTime? currentBackPressTime;

  // Future<bool> onWillPop() {
  //   DateTime now = DateTime.now();
  //   if (currentBackPressTime == null ||
  //       now.difference(currentBackPressTime) > Duration(seconds: 2)) {
  //     currentBackPressTime = now;
  //     Fluttertoast.showToast(msg: exit_warning);
  //     return Future.value(false);
  //   }
  //   return Future.value(true);
  // }
}
