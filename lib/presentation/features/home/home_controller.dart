import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  // final ProfileController profileController = Get.find<ProfileController>();
  // final AuthController authController = Get.find<AuthController>();

  List<Widget> portfolio = [
    const SizedBox(width: 8.0),
    const PortfolioCard(
        title: 'Wedding Salsa & Fauzan',
        fileName: 'Wedding Salsa & Fauzan.jpg',
        date: '25 September 2021',
        location: 'Istana Ballroom, Hotel Salak The Heritage Bogor'),
    const PortfolioCard(
        title: 'Wedding Ulfa & Reza',
        fileName: 'Wedding Ulfa & Reza.jpg',
        date: '6 Mei 2018'),
    const PortfolioCard(
        title: 'Event Pertamina',
        fileName: 'Event Pertamina.jpg',
        location: 'Mall Kota Kasablanka',
        date: '29 Juli - 31 Juli 2016'),
    const PortfolioCard(
        title: 'Wedding Rizki & Lian',
        fileName: 'Wedding Rizki & Lian.jpg',
        date: '19 Maret 2016'),
    const PortfolioCard(
        title: 'My AXA Claims Launch',
        fileName: 'My AXA Claims Launch 7th March 2016.jpg',
        location: 'Hard Rock Cafe, SCBD Jakarta',
        date: '7 Maret 2016'),
    const PortfolioCard(
        title: 'Wedding Riska & Luthfi',
        fileName: 'Wedding Riska & Luthfi.jpg',
        location: 'Sudirman Pusdik Armed, Cimahi Bandung',
        date: '27 Desember 2015'),
    const PortfolioCard(
        title: 'Wedding Rindia & Rangga',
        fileName: 'Wedding Rindia & Rangga.jpg',
        location: 'Manggala Wanabakti Jakarta',
        date: '1 Agustus 2015'),
    const PortfolioCard(
        title: 'Mommychi Application Launch',
        fileName: 'Mommychi Application Launch.jpg',
        location: 'The Cone FX Plaza Jakarta',
        date: '15 Januari 2014'),
    const PortfolioCard(
        title: 'Wedding Event',
        fileName: 'Wedding Event.jpg',
        location: 'Auditorium BBAT Sukabumi',
        date: '17 Agustus 2013'),
    const PortfolioCard(
        fileName: 'Event Gathering Prenagen & The City.jpg',
        title: 'Event Gathering : Prenagen & The City',
        location: 'Ballroom Grand Kemang Hotel',
        date: '18 Mei 2013'),
    const SizedBox(width: 8.0),
  ];

  List<CardAdvantages> advantages = [
    const CardAdvantages(
        icon: Icons.access_time_rounded,
        title: 'Efisiensi Waktu',
        subtitle: 'Registrasi cepat hanya membutuhkan waktu 5 detik per-orang'),
    const CardAdvantages(
        icon: Icons.checklist_rtl_rounded,
        title: 'Validasi Tamu',
        subtitle:
            'Identifikasi tamu dengan fitur capture foto pada saat registrasi'),
    const CardAdvantages(
        icon: Icons.perm_identity_rounded,
        title: 'Identifikasi Tamu',
        subtitle:
            'Filtering tamu sesuai dengan kategorinya (Regular, VIP, VVIP)'),
    const CardAdvantages(
        icon: Icons.verified_user_rounded,
        title: 'Data Akurat',
        subtitle: 'Data tamu beserta detail kedatangan tamu sangar akurat'),
    const CardAdvantages(
        icon: Icons.health_and_safety_rounded,
        title: 'Safety & Healty',
        subtitle:
            'Contactless dengan perangkat apapun sesuai dengan prokes covid 19'),
    const CardAdvantages(
        icon: Icons.savings_rounded,
        title: 'Saving Cost',
        subtitle: 'Paperless karena menggunakan digital invitation card'),
    const CardAdvantages(
        icon: Icons.mobile_friendly_rounded,
        title: 'Simple',
        subtitle: 'Instalasi mudah, compatible unit installation')
  ];

  Future<void> createAddPhoneDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return GesbukUserAlertDialog(
          alertType: AlertType.success,
          middleText: 'Berhasil menambahkan Event.',
          actions: <Widget>[
            TextButton(onPressed: () => Get.back(), child: const Text('Tutup'))
          ],
        );
      },
    );
  }

  Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
