import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/domain/entities/onboarding_item.dart';
import 'package:flutter_gesbuk_user/presentation/features/auth/auth.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnboardingItem> itemList = [
      OnboardingItem(
          bodyText:
              'Registrasi menjadi Cepat, Efisien, Aman, Modern dan Unik yang cocok untuk berbagai event anda.',
          svgPath: 'undraw_to_do_list_re_9nt7.svg'),
      OnboardingItem(
          bodyText:
              'Registrasi mudah dengan tanpa kontak fisik sesuai dengan Protokol Kesehatan saat masa NEW NORMAL saat ini.',
          svgPath: 'undraw_social_distancing_2g0u.svg'),
      OnboardingItem(
          bodyText:
              'Tamu dapat teridentifikasi karena adanya Photo Capture dan tamu dapat terfilter sesuai kategori untuk kebutuhan Protokoler.',
          svgPath: 'undraw_live_photo_re_4khn.svg'),
      OnboardingItem(
          bodyText:
              'Card invitation Digital (Paperless) sehingga hemat kertas undangan',
          svgPath: 'undraw_delivery_re_f50b.svg'),
    ];

    return GesbukUserScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top + 24),
            Padding(
              padding: const EdgeInsets.only(right: AppSizes.sidePadding),
              child: Image.asset(
                'assets/images/gesbuk-logo.png',
                width: AppSizes.baseSize * 16,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: itemList
                        .map((item) => _buildCarouselContent(context, item))
                        .toList(),
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          controller.getIndex(index);
                        },
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        aspectRatio: 16 / 14,
                        autoPlay: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1200),
                        autoPlayInterval: const Duration(seconds: 7),
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn),
                  ),
                  SizedBox(
                      height: 16.0,
                      child: Obx(
                        () => _buildIndicator(
                            controller.indicatorIndex.value, itemList),
                      ))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
              child: GesbukUserPrimaryButtonIcon(
                isImageIcon: true,
                label: 'Lanjutkan dengan Google ',
                imagePath: 'google-fill.svg',
                onPressed: () => controller.signInWithGoogle(),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
              child: controller.obx(
                (_) => const SizedBox(
                  height: AppSizes.linePadding,
                ),
                onLoading: const LinearProgressIndicator(
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
            
            const SizedBox(height: 8.0),
            Obx(() => Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    'v${controller.appVersion.value}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                )),
            const SizedBox(height: 16.0)
          ],
        ),
      ),
    );
  }

  ListView _buildIndicator(int i, List<OnboardingItem> item) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: item.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.linePadding),
          child: index == i
              ? const CircleAvatar(
                  radius: 5.0, backgroundColor: AppColors.lightBlue)
              : const CircleAvatar(
                  radius: 4.0, backgroundColor: Colors.black12),
        );
      },
    );
  }

  Column _buildCarouselContent(BuildContext context, OnboardingItem item) {
    return Column(
      children: [
        Expanded(
          child: SvgPicture.asset(
            'assets/images/${item.svgPath}',
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16.0),
          child: Text(
            item.bodyText,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        )
      ],
    );
  }
}
