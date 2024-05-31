import 'package:flutter/material.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/fonts.gen.dart';

final appTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AppColors.black,
  fontFamily: FontFamily.sFProDisplay,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  brightness: Brightness.dark,
  hoverColor: Colors.transparent,
  focusColor: Colors.transparent,
  splashFactory: InkRipple.splashFactory,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.white,
    selectionHandleColor: AppColors.white,
  ),
);
