import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';

class BaseContainerWidget extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final bool isBorderDotted;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final double? height;
  final double? width;
  final Color? color;
  final Color borderColor;
  final void Function()? onTap;

  const BaseContainerWidget({
    required this.child,
    this.borderRadius = AppDimens.borderRadius12,
    this.isBorderDotted = false,
    this.padding,
    this.margin,
    this.alignment,
    this.height,
    this.width,
    this.color,
    this.borderColor = Colors.transparent,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(isBorderDotted ? AppDimens.padding2 : AppDimens.padding0).r,
        child: Container(
          padding: padding,
          margin: margin,
          alignment: alignment,
          decoration: BoxDecoration(
            // color: color ?? AppColors.of(context).bgScreenSecondary,
            border: isBorderDotted
                ? null
                : Border.all(
                    color: borderColor,
                    width: AppDimens.size2.w,
                  ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
