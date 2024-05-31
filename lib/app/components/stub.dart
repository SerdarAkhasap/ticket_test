import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_plane_ticket/app/components/custom_button.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class Stub extends StatelessWidget {
  const Stub({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Заглушка', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white),),
        15.h,
        CustomButton(
          width: double.infinity,
            height: 42,
            buttonText: 'Назад',
            splashColor: AppColors.grey3,
            onPressed: () => { context.pop()}).sidePad(24)
      ],
    );
  }
}
