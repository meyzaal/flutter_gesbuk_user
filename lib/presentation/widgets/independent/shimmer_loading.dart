import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/color.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

enum ShimmerType { circle, rectangle }

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    Key? key,
    this.height,
    this.width,
    this.type = ShimmerType.rectangle,
    this.radius = 24.0,
    this.baseColor,
    this.highlightColor = Colors.white70,
    this.backgroundColor = Colors.white,
    this.withBorderRadius = true,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double radius;
  final ShimmerType type;
  final Color? baseColor;
  final Color highlightColor;
  final Color backgroundColor;
  final bool withBorderRadius;

  @override
  Widget build(BuildContext context) {
    return type == ShimmerType.rectangle
        ? Shimmer.fromColors(
            baseColor: baseColor ?? Color(HexColor.getColorFromHex('#e9e9e9')),
            highlightColor: highlightColor,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: withBorderRadius
                    ? BorderRadius.circular(AppSizes.widgetBorderRadius)
                    : null,
              ),
            ),
          )
        : Shimmer.fromColors(
            baseColor: baseColor ?? Color(HexColor.getColorFromHex('#e9e9e9')),
            highlightColor: highlightColor,
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              radius: radius,
            ),
          );
  }
}
