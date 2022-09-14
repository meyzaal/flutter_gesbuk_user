// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthController extends GetxController with StateMixin {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<User?> get streamAuthStatus => _firebaseAuth.authStateChanges();
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

        // Print firebase token for testing postman
        print('===========FIREBASE TOKEN START===========');
        while (token!.isNotEmpty) {
          int initLength = (token.length >= 500 ? 500 : token.length);
          print(token.substring(0, initLength));
          int endLength = token.length;
          token = token.substring(initLength, endLength);
        }
        print('===========FIREBASE TOKEN END===========');

        // change(null, status: RxStatus.success());

        Get.toNamed('/home');
      }
    } on FirebaseAuthException catch (firebaseError) {
      signOut();
      // change()
      Get.defaultDialog(middleText: firebaseError.toString(), title: 'Error!');
    } catch (error) {
      signOut();
      if (error.toString().contains(
          "Failed assertion: line 43 pos 12: 'accessToken != null || idToken != null': At least one of ID token and access token is required")) {
        return;
      }
      Get.defaultDialog(middleText: error.toString(), title: 'Error!');
    }
  }

  signOut() {
    try {
      _firebaseAuth.signOut();
      _googleSignIn.signOut();

      Get.offAllNamed('/login');
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  getIndex(int i) {
    indicatorIndex.value = i;
  }

  getPackageInfo() async {
    try {
      await PackageInfo.fromPlatform()
          .then((value) => appVersion.value = value.version);

      print(appVersion.value);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onReady() {
    change(null, status: RxStatus.success());
    getPackageInfo();
    super.onReady();
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
