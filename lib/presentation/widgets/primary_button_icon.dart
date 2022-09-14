import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GesbukUserPrimaryButtonIcon extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? imagePath;
  final bool isImageIcon;
  final void Function() onPressed;

  const GesbukUserPrimaryButtonIcon({
    Key? key,
    required this.label,
    this.icon,
    required this.onPressed,
    required this.isImageIcon,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          ),
          padding: const EdgeInsets.all(AppSizes.sidePadding),
        ),
        icon: isImageIcon
            ? SvgPicture.asset(
                'assets/icons/$imagePath',
                color: Colors.white,
                width: 24.0,
              )
            : Icon(icon),
        label: Text(label),
      ),
    );
  }
}
