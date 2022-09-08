import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';

class GesbukUserSecondaryButtonIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onPressed;
  final bool isExpand;

  const GesbukUserSecondaryButtonIcon({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isExpand = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpand ? double.infinity : null,
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
