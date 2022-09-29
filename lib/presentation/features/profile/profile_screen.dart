import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:flutter_gesbuk_user/presentation/features/profile/profile.dart';
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
      blankAppBar: false,
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

  _buildProfileCard(BuildContext context) {
    return controller.obx((data) {
      String? phone = data?.phone;
      String? finalPhone =
          phone != null ? '${phone.substring(0, phone.length - 5)}*****' : null;

      return ProfileCardBackground(
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: AppColors.background,
                  radius: 32.0,
                  child: CircleAvatar(
                    backgroundImage: data?.picture != null
                        ? NetworkImage(data?.picture ?? '')
                        : null,
                    backgroundColor: AppColors.background,
                    radius: 31.0,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data?.name ?? '',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: AppSizes.linePadding),
                      data?.phone != null
                          ? Text(
                              finalPhone ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.apply(color: AppColors.white),
                            )
                          : const SizedBox(),
                      Text(
                        data?.email ?? '',
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
                top: 0.0,
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
    },
        onLoading: ProfileCardBackground(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const ShimmerLoading(
                  baseColor: Color.fromARGB(38, 255, 255, 255),
                  type: ShimmerType.circle,
                  radius: 32.0),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ShimmerLoading(
                        baseColor: const Color.fromARGB(38, 255, 255, 255),
                        highlightColor: AppColors.lightBlue,
                        height: Theme.of(context).textTheme.headline6?.fontSize,
                        width: 200),
                    const SizedBox(height: 14.0),
                    ShimmerLoading(
                      baseColor: const Color.fromARGB(38, 255, 255, 255),
                      highlightColor: AppColors.lightBlue,
                      height: Theme.of(context).textTheme.subtitle1?.fontSize,
                      width: 160,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
