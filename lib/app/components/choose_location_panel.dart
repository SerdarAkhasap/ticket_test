
import 'package:flutter/material.dart';
import 'package:online_plane_ticket/app/components/custom_text_field.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class ChooseLocationPanel extends StatelessWidget {
   ChooseLocationPanel(
      {super.key,
      this.controllerFrom,
      this.controllerTo,
      this.onSubmittedFrom,
      this.onSubmittedTo,
      this.readOnlyFrom = false,
      this.readOnlyTo = false,
      this.mainBackgroundColor,
      this.secondBackgroundColor,
      this.icon,
      this.prependIconFrom,
      this.appendIconFrom,
      this.appendIconTo,
      this.prependIconTo,
      this.onTapFrom,
      this.onTapTo,
      this.onPrependIconClickFrom,
      this.onAppendIconClickFrom,
      this.onPrependIconClickTo,
      this.onAppendIconClickTo,
      this.onChangedFrom,
      this.onChangedTo, this.onIconClick}) {
    if (mainBackgroundColor != null && mainBackgroundColor == Colors.transparent) {
      padding = EdgeInsets.zero;
    }
  }

  final TextEditingController? controllerFrom;
  final TextEditingController? controllerTo;
  final Function(String)? onSubmittedFrom;
  final Function(String)? onSubmittedTo;
  final bool readOnlyFrom;
  final bool readOnlyTo;
  final Color? mainBackgroundColor;
  final Color? secondBackgroundColor;
  final Widget? icon;
  final Widget? prependIconFrom;
  final Widget? appendIconFrom;
  final Widget? prependIconTo;
  final Widget? appendIconTo;
  final Function()? onTapFrom;
  final Function()? onTapTo;
  final Function()? onIconClick;
  final Function()? onPrependIconClickFrom;
  final Function()? onAppendIconClickFrom;
  final Function()? onPrependIconClickTo;
  final Function()? onAppendIconClickTo;
  final Function(String str)? onChangedFrom;
  final Function(String str)? onChangedTo;
  EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 126,
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: mainBackgroundColor ?? AppColors.grey7),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: secondBackgroundColor ?? AppColors.grey3),
        padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              GestureDetector(
                onTap: onIconClick,
                child: icon!,
              ),
            if (icon != null)
            16.w,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (prependIconFrom != null)
                          GestureDetector(
                            onTap: onPrependIconClickFrom,
                            child: prependIconFrom!,
                          ),
                        if (prependIconFrom != null)
                          8.w,
                        Expanded(
                            child: CustomTextField(
                              onChanged: onChangedFrom,
                              onTap: onTapFrom,
                              onSubmitted: onSubmittedFrom,
                              controller: controllerFrom,
                              readOnly: readOnlyFrom,
                              hintText: 'Откуда - Москва',
                              style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              hintStyle: const TextStyle(
                                  color: AppColors.grey5,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            )),
                        if (appendIconFrom != null)
                          8.w,
                        if (appendIconFrom != null)
                          GestureDetector(
                            onTap: onAppendIconClickFrom,
                            child: appendIconFrom!,
                          )
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.grey4),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (prependIconTo != null)
                          GestureDetector(
                            onTap: onPrependIconClickTo,
                            child: prependIconTo!,
                          ),
                        if (prependIconTo != null)
                          8.w,
                        Expanded(
                            child: CustomTextField(
                              onSubmitted: onSubmittedTo,
                              onChanged: onChangedTo,
                              onTap: onTapTo,
                              readOnly: readOnlyTo,
                              hintText: 'Куда - Турция',
                              hintStyle: const TextStyle(
                                  color: AppColors.grey5,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              controller: controllerTo,
                            )),
                        if (appendIconTo != null)
                          8.w,
                        if (appendIconTo != null)
                          GestureDetector(
                            onTap: onAppendIconClickTo,
                            child: appendIconTo!,
                          )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
