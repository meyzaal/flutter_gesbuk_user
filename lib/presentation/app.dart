import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/pages.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: GesbukUserTheme.of(context),
      getPages: GesbukUserPages.routes,
      initialRoute: GesbukUserRoutes.home,
    );
  }
}
