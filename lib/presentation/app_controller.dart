import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => _firebaseAuth.authStateChanges();

}
