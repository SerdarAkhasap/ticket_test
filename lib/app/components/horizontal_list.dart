import 'package:flutter/material.dart';
import 'package:online_plane_ticket/app/components/custom_button.dart';
import 'package:online_plane_ticket/app/components/horizontal_list_item.dart';
import 'package:online_plane_ticket/domain/entities/route_model.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key, required this.title, required this.items, this.marginBetweenItems = 67, required this.images});

  final String title;
  final List<RouteModel> items;
  final int marginBetweenItems;
  final List<Widget> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ).sidePad(16),
          25.h,
          SizedBox(
            height: 220,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (con, index) => HorizontalListItem(
                item: items[index],
                image: images[index],
              ),
              separatorBuilder: (context, index) => marginBetweenItems.w,
            ),
          ),
          16.h,
          CustomButton(
            buttonText: 'Показать все места',
            onPressed: () => {},
            height: 42,
            width: double.infinity,
            backgroundColor: AppColors.grey7,
            borderRadius: 8,
            splashColor: AppColors.grey1,
          ).sidePad(16)
        ],
      ),
    );
  }
}
