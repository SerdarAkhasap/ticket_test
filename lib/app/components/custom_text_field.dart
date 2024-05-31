
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.enabled,
      this.height,
      this.maxLength,
      this.keyboardType,
      this.style,
      this.inputFormatters,
      this.focusNode,
      this.hintStyle,
      this.onSubmitted,
      this.readOnly = false,
      this.onTap,
      this.onChanged});

  String? hintText;
  TextStyle? hintStyle;
  TextEditingController? controller;
  bool? enabled;
  double? height;
  int? maxLength;
  TextInputType? keyboardType;
  TextStyle? style;
  List<TextInputFormatter>? inputFormatters;
  FocusNode? focusNode;
  Function(String str)? onSubmitted;
  Function(String str)? onChanged;
  Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: TextField(
        onTap:onTap,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        focusNode: focusNode,
        inputFormatters: inputFormatters ?? [
          FilteringTextInputFormatter.allow(
              RegExp(r'[\u0401\u0451\u0410-\u044f]'))
        ],
        readOnly: readOnly,
        maxLength: maxLength,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: TextInputAction.next,
        style: style ??
            const TextStyle(
              fontSize: 13,
            ),
        cursorColor: AppColors.white,
        cursorWidth: 1,
        decoration: InputDecoration.collapsed(
            hintText: hintText,
            hintStyle: hintStyle,
        ),
      ),
    );
  }
}
