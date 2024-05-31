import 'package:flutter/material.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class RouteButton extends StatelessWidget {
  const RouteButton(
      {super.key,
      required this.title,
      required this.icon,
      this.backgroundColor = AppColors.grey2,
      this.onTap});

  final String title;
  final Widget icon;
  final Color backgroundColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 70,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: backgroundColor),
              child: icon,
            ),
            8.h,
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
