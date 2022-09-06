import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';

class GesbukSecondaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const GesbukSecondaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.mainColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          ),
          padding: const EdgeInsets.all(AppSizes.sidePadding),
        ),
        child: Text(label),
      ),
    );
  }
}
