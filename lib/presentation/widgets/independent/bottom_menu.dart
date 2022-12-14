import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:get/get.dart';

class GesbukUserBottomMenu extends StatelessWidget {
  final int menuIndex;

  const GesbukUserBottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(int index) {
    return index == menuIndex ? AppColors.mainColor : Colors.black26;
  }

  BottomNavigationBarItem getItem(String title, IconData iconData, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          iconData,
          color: colorByIndex(index),
        ),
        label: title);
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> menuItems = [
      getItem('Home', Icons.home_rounded, 0),
      getItem('My Event', Icons.event_note_rounded, 1),
      getItem('Price List', Icons.menu_book_outlined, 2),
      getItem('Profile', Icons.person_rounded, 3)
    ];

    return BottomNavigationBar(
      items: menuItems,
      type: BottomNavigationBarType.fixed,
      currentIndex: menuIndex,
      backgroundColor: AppColors.backgroundLight,
      selectedFontSize: 12.0,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
      elevation: 16.0,
      onTap: (value) {
        switch (value) {
          case 0:
            Get.offNamedUntil('/home', ModalRoute.withName('/home'));
            break;
          case 1:
            Get.offNamedUntil('/my_event', ModalRoute.withName('/home'));
            break;
          case 2:
            Get.offNamedUntil('/price_list', ModalRoute.withName('/home'));
            break;
          case 3:
            Get.offNamedUntil('/profile', ModalRoute.withName('/home'));
            break;
        }
      },
    );
  }
}
