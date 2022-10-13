import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';

class GesbukSecondaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final bool isExpand;
  final Color? backgroundColor;

  const GesbukSecondaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isExpand = true,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpand ? double.infinity : null,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
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
