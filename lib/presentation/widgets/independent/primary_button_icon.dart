import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';

class GesbukUserPrimaryButtonIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onPressed;

  const GesbukUserPrimaryButtonIcon({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
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
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
