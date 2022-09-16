import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';

class GesbukUserPrimaryButton extends StatelessWidget {
  final String label;
  final bool isExpand;
  final void Function() onPressed;

  const GesbukUserPrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isExpand = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpand ? double.infinity : null,
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
