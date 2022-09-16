import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:flutter_gesbuk_user/presentation/features/profile/profile_controller.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({super.key});

  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    List<GesbukUserListTile> buttonList = [
      GesbukUserListTile(
          leading: Obx(() => controller.isDark.value
              ? const Icon(Icons.dark_mode_rounded)
              : const Icon(Icons.light_mode_rounded)),
          title: Text(
            'Tema',
            style: Theme.of(context).textTheme.button,
          ),
          subtitle: Obx(
            () => controller.isDark.value
                ? Text('Ubah tema ke terang',
                    style: Theme.of(context).textTheme.caption)
                : Text('Ubah tema ke gelap',
                    style: Theme.of(context).textTheme.caption),
          ),
          trailing: Obx(
            () => Switch(
                activeColor: AppColors.mainColor,
                value: controller.isDark.value,
                onChanged: (bool val) {
                  controller.changeTheme(context, val);
                }),
          )),
      GesbukUserListTile(
        leading: const Icon(Icons.info_rounded),
        title: Text(
          'Tentang Gesbuk',
          style: Theme.of(context).textTheme.button,
        ),
        subtitle: Text(
          'Informasi mengenai aplikasi Gesbuk',
          style: Theme.of(context).textTheme.caption,
        ),
        onTap: () =>
            Get.toNamed('/info', arguments: _authController.appVersion.value),
      ),
      GesbukUserListTile(
        leading: const Icon(Icons.logout_rounded),
        title: Text(
          'Sign Out',
          style: Theme.of(context).textTheme.button,
        ),
        subtitle: Text(
          'Keluar dari aplikasi',
          style: Theme.of(context).textTheme.caption,
        ),
        onTap: () => _authController.signOut(),
      ),
    ];

    return GesbukUserScaffold(
      body: Column(
        children: <Widget>[
          _buildProfileCard(context),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return buttonList[index];
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8.0);
                    },
                    itemCount: buttonList.length)),
          ),
          Obx(() => Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  'v${_authController.appVersion.value}',
                  style: Theme.of(context).textTheme.caption,
                ),
              )),
          const SizedBox(height: 16.0),
        ],
      ),
      bottomMenuIndex: 3,
    );
  }

  Container _buildProfileCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.sidePadding, vertical: 16.0),
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16.0),
      height: AppSizes.baseSize * 15,
      decoration: const BoxDecoration(
          color: AppColors.mainColor,
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [
                0.0,
                0.6,
                0.9
              ],
              colors: [
                AppColors.lightBlue,
                AppColors.mainColor,
                AppColors.secondaryColor
              ]),
          borderRadius:
              BorderRadius.all(Radius.circular(AppSizes.widgetBorderRadius))),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const CircleAvatar(
                backgroundColor: AppColors.background,
                radius: 32.0,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Meyza Ulil Albab',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: AppSizes.linePadding),
                    Text(
                      '+62089512340987',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.apply(color: AppColors.white),
                    ),
                    Text(
                      'almayza17@gmail.com',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.apply(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 16.0,
              right: 0,
              child: IconButton(
                onPressed: () => Get.toNamed('/edit_profile'),
                icon: const Icon(
                  Icons.edit_rounded,
                  color: AppColors.white,
                  size: 16.0,
                ),
              ))
        ],
      ),
    );
  }
}
