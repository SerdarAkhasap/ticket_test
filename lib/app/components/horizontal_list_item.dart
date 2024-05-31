import 'package:flutter/material.dart';
import 'package:online_plane_ticket/app/utils/utils.dart';
import 'package:online_plane_ticket/domain/entities/route_model.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/assets.gen.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class HorizontalListItem extends StatelessWidget {
  const HorizontalListItem({super.key, required this.item, required this.image});

  final RouteModel item;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 133,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: image
            ),
          ),
          8.h,
           Text( item.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.white),),
          8.h,
           Text(item.town, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white),),
          4.h,
          Row(children: [
            Assets.icons.plane.svg(width: 24, height: 24, color: AppColors.grey5),
            Text('от ${formatPrice(item.price.value)} ₽', style:  const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white),)
          ],)
        ],
      ),
    );
  }
}
