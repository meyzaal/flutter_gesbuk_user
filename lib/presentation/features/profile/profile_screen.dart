import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GesbukUserScaffold(
      // appBarTitle: 'Profil',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top + 8.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              height: 168.0,
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
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppSizes.widgetBorderRadius))),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600),
                            ),
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
                                  .subtitle2
                                  ?.apply(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 24.0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_rounded,
                          color: AppColors.white,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
      bottomMenuIndex: 3,
    );
  }
}
