import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';

enum TextFieldBorderStyle { outline, underline }

class GesbukUserTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextFieldBorderStyle textFieldBorderStyle;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autoFocus;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;

  const GesbukUserTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textFieldBorderStyle = TextFieldBorderStyle.outline,
    this.controller,
    this.focusNode,
    this.autoFocus = false,
    this.onEditingComplete,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autofocus: autoFocus,
      onEditingComplete: onEditingComplete,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: (prefixIcon != null) ? Icon(prefixIcon) : null,
        suffixIcon: (suffixIcon != null) ? Icon(suffixIcon) : null,
        focusedBorder: textFieldBorderStyle == TextFieldBorderStyle.outline
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor),
                borderRadius:
                    BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
              )
            : const UnderlineInputBorder(),
        border: textFieldBorderStyle == TextFieldBorderStyle.outline
            ? const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.textFieldRadius),
                ),
              )
            : const UnderlineInputBorder(),
      ),
    );
  }
}
