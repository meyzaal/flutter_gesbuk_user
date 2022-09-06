import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';

class GesbukUserTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const GesbukUserTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: (prefixIcon != null) ? Icon(prefixIcon) : null,
        suffixIcon: (suffixIcon != null) ? Icon(suffixIcon) : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius:
              BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.textFieldRadius),
          ),
        ),
      ),
    );
  }
}
