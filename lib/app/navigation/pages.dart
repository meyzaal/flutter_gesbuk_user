import 'package:flutter_gesbuk_user/presentation/features/edit_profile/edit_profile_screen.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event_binding.dart';
import 'package:flutter_gesbuk_user/presentation/features/event_detail/event_detail_screen.dart';
import 'package:flutter_gesbuk_user/presentation/features/home/home.dart';
import 'package:flutter_gesbuk_user/presentation/features/home/home_binding.dart';
import 'package:flutter_gesbuk_user/presentation/features/info/info_screen.dart';
import 'package:flutter_gesbuk_user/presentation/features/price_list/price_list.dart';
import 'package:flutter_gesbuk_user/presentation/features/profile/profile.dart';
import 'package:flutter_gesbuk_user/presentation/features/profile/profile_binding.dart';
import 'package:get/get.dart';

import '../../presentation/features/auth/auth.dart';

part 'routes.dart';

class GesbukUserPages {
  GesbukUserPages._();

  static final routes = [
    GetPage(
        name: GesbukUserRoutes.home,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
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
        name: GesbukUserRoutes.eventDetail,
        page: () => const EventDetailScreen()),
    GetPage(
        name: GesbukUserRoutes.priceList,
        page: () => const PriceListScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: GesbukUserRoutes.profile,
        page: () => ProfileScreen(),
        bindings: [ProfileBinding(), AuthBinding()],
        transition: Transition.noTransition),
    GetPage(
      name: GesbukUserRoutes.info,
      page: () => const InfoScreen(),
    ),
    GetPage(
      name: GesbukUserRoutes.editProfile,
      page: () => const EditProfileScreen(),
    ),
  ];
}
