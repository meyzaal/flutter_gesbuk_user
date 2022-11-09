// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gesbuk_user/app/services/firebase.dart';
import 'package:flutter_gesbuk_user/presentation/app.dart';
import 'package:get/get.dart';

import 'app/services/local_storage.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // WidgetsFlutterBinding widgetsFlutterBinding = WidgetsFlutterBinding();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);
  WidgetsFlutterBinding();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initServices();

  runApp(App());
}

initServices() async {
  print('starting services ...');
  await Get.putAsync(() => LocalStorageService().init());
  await Get.putAsync(() => FirebaseService().init(), permanent: true);
  print('All services started...');
}
