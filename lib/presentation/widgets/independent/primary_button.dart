import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';

class GesbukUserPrimaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const GesbukUserPrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
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
