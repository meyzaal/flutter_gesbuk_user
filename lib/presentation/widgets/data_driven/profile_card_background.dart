import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';

class ProfileCardBackground extends StatelessWidget {
  final Widget child;
  const ProfileCardBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
          16.0, MediaQuery.of(context).padding.top + 32.0, 0.0, 32.0),
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
      ),
      child: child,
    );
  }
}
