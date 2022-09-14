import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/navigation/pages.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/loading_screen.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  App({super.key});

  final AuthController _authController =
      Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authController.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            theme: GesbukUserTheme.of(context),
            getPages: GesbukUserPages.routes,
            initialRoute: (snapshot.data?.emailVerified == true)
                ? GesbukUserRoutes.home
                : GesbukUserRoutes.login,
          );
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
