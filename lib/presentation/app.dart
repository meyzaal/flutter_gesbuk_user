import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/navigation/pages.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/app_controller.dart';
import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/loading_screen.dart';
import 'package:get/get.dart';

class App extends GetView<AuthController> {
  App({super.key});

  final AppController _appController =
      Get.put(AppController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _appController.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            theme: GesbukUserTheme.of(context),
            getPages: GesbukUserPages.routes,
            initialRoute: (snapshot.data?.emailVerified == true)
                ? GesbukUserRoutes.home
                : GesbukUserRoutes.login,
            // initialBinding: AuthBinding(),
          );
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
