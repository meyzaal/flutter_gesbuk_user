import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gesbuk_user/presentation/app.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsFlutterBinding widgetsFlutterBinding = WidgetsFlutterBinding();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const App());
}
