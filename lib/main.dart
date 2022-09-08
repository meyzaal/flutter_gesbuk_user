import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gesbuk_user/firebase_options.dart';
import 'package:flutter_gesbuk_user/presentation/app.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // WidgetsFlutterBinding widgetsFlutterBinding = WidgetsFlutterBinding();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);
  WidgetsFlutterBinding();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const App());
}
