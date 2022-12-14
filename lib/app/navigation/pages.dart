import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:flutter_gesbuk_user/presentation/features/edit_profile/edit_profile.dart';
import 'package:flutter_gesbuk_user/presentation/features/event/event.dart';
import 'package:flutter_gesbuk_user/presentation/features/event_detail/event_detail.dart';
import 'package:flutter_gesbuk_user/presentation/features/guest_list/guest_list.dart';
import 'package:flutter_gesbuk_user/presentation/features/image_preview/image_preview.dart';
import 'package:flutter_gesbuk_user/presentation/features/search_guest/search_guest.dart';
import 'package:flutter_gesbuk_user/presentation/features/home/home.dart';
import 'package:flutter_gesbuk_user/presentation/features/info/info_screen.dart';
import 'package:flutter_gesbuk_user/presentation/features/price_list/price_list.dart';
import 'package:flutter_gesbuk_user/presentation/features/profile/profile.dart';
import 'package:flutter_gesbuk_user/presentation/features/scanner/scanner.dart';
import 'package:get/get.dart';

part 'routes.dart';

class GesbukUserPages {
  GesbukUserPages._();

  static final routes = [
    GetPage(
        name: GesbukUserRoutes.home,
        page: () => const HomeScreen(),
        bindings: [
          HomeBinding(),
          ProfileBinding(),
          AuthBinding(),
          EventBinding()
        ],
        transition: Transition.noTransition),
    GetPage(
        name: GesbukUserRoutes.login,
        binding: AuthBinding(),
        page: () => const LoginScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: GesbukUserRoutes.myEvent,
        page: () => const EventScreen(),
        bindings: [EventBinding(), AuthBinding()],
        transition: Transition.noTransition),
    GetPage(
        name: GesbukUserRoutes.eventDetail,
        page: () => const EventDetailScreen(),
        bindings: [EventDetailBinding(), AuthBinding()]),
    GetPage(
        name: GesbukUserRoutes.scanner,
        page: () => const ScannerScreen(),
        bindings: [ScannerBinding(), AuthBinding(), GuestListBinding()]),
    GetPage(
        name: GesbukUserRoutes.guestList,
        page: () => const GuestListScreen(),
        bindings: [GuestListBinding(), EventDetailBinding()]),
    GetPage(
        name: GesbukUserRoutes.searchGuest,
        page: () => const SearchGuestScreen(),
        bindings: [
          GuestListBinding(),
          SearchGuestBinding(),
          EventDetailBinding()
        ],
        transition: Transition.noTransition),
    GetPage(
        name: GesbukUserRoutes.imagePreview,
        page: () => const ImagePreviewScreen(),
        bindings: [ImagePreviewBinding(), GuestListBinding()]),
    GetPage(
        name: GesbukUserRoutes.priceList,
        page: () => const PriceListScreen(),
        binding: PriceListBinding(),
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
      page: () =>  EditProfileScreen(),
    ),
  ];
}
