import 'package:flutter/material.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
        required this.buttonText,
        required this.onPressed,
        this.backgroundColor,
        this.textColor,
        this.height,
        this.borderRadius,
        this.textWeight,
        this.splashColor,
        this.width,
        this.disabled,
        this.padding,
        this.textStyle});

  final String buttonText;
  final Function() onPressed;
  Color? backgroundColor;
  Color? textColor;
  double? height;
  double? width;
  double? borderRadius;
  FontWeight? textWeight;
  Color? splashColor;
  bool? disabled;
  EdgeInsets? padding;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: disabled != null && disabled! ? null : onPressed,
        style: ElevatedButton.styleFrom(
            padding: padding,
            foregroundColor: splashColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 7)),
            backgroundColor: backgroundColor ?? AppColors.grey1),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: textStyle ?? TextStyle(
              color: textColor ?? Colors.white, fontWeight: textWeight),
        ),
      ),
    );
  }
}
