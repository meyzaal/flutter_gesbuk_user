import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';

class GesbukUserSecondaryButtonIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onPressed;

  const GesbukUserSecondaryButtonIcon({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.mainColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          ),
          padding: const EdgeInsets.all(AppSizes.sidePadding),
        ),
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
