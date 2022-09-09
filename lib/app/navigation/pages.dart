import 'package:flutter_gesbuk_user/presentation/features/event/event.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event_binding.dart';
import 'package:flutter_gesbuk_user/presentation/features/home/home.dart';
import 'package:flutter_gesbuk_user/presentation/features/login/auth_binding.dart';
import 'package:flutter_gesbuk_user/presentation/features/login/login_screen.dart';
import 'package:flutter_gesbuk_user/presentation/features/price_list/price_list.dart';
import 'package:flutter_gesbuk_user/presentation/features/profile/profile.dart';
import 'package:get/get.dart';

part 'routes.dart';

class GesbukUserPages {
  GesbukUserPages._();

  static final routes = [
    GetPage(
        name: GesbukUserRoutes.home,
        page: () => const HomeScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: GesbukUserRoutes.login,
        binding: AuthBinding(),
        page: () => const LoginScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: GesbukUserRoutes.myEvent,
        page: () => const EventScreen(),
        binding: EventBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: GesbukUserRoutes.priceList,
        page: () => const PriceListScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: GesbukUserRoutes.profile,
        page: () => const ProfileScreen(),
        transition: Transition.noTransition),
  ];
}
