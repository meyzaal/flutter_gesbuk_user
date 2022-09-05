import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/pages.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          },
        ),
      ),
      getPages: GesbukUserPages.routes,
      initialRoute: GesbukUserRoutes.home,
    );
  }
}
