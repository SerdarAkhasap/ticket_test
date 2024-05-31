import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_plane_ticket/app/pages/home/home_controller.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/assets.gen.dart';
import 'package:online_plane_ticket/app/utils/utils.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class FlightDetailsList extends StatelessWidget {
  FlightDetailsList({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 33,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          children: [
            Obx(
              () => FlightDetailsItem(
                onTap: () =>
                    {homeController.showCustomCalendar(context, RouteType.to)},
                items: [
                  if (homeController.isToAvailable())
                    Text(
                      getDayMonth(dateTime: homeController.toDate.value),
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  if (homeController.isToAvailable())
                    Text(
                      getWeekDay(dateTime: homeController.toDate.value),
                      style:
                          const TextStyle(fontSize: 14, color: AppColors.grey4),
                    ),
                  if (!homeController.isToAvailable())
                    const Icon(
                      Icons.add,
                      size: 16,
                    ),
                  if (!homeController.isToAvailable()) 8.w,
                  if (!homeController.isToAvailable())
                    Text(
                      'обратно',
                      style: textStyle,
                    ),
                ],
                width: 105,
              ),
            ),
            8.w,
            FlightDetailsItem(
              onTap: () =>
                  {homeController.showCustomCalendar(context, RouteType.from)},
              items: [
                Obx(() => Text(
                      getDayMonth(dateTime: homeController.fromDate.value),
                      style: textStyle,
                      textAlign: TextAlign.center,
                    )),
                Obx(() => Text(
                      getWeekDay(dateTime: homeController.fromDate.value),
                      style:
                          const TextStyle(fontSize: 14, color: AppColors.grey4),
                    ))
              ],
              width: 88,
            ),
            8.w,
            FlightDetailsItem(
              items: [
                Assets.icons.man.svg(),
                8.w,
                Text(
                  '1,эконом',
                  style: textStyle,
                ),
              ],
              width: 104,
            ),
            8.w,
            FlightDetailsItem(
              items: [
                Assets.icons.filter.svg(width: 16, height: 16),
                8.w,
                Text(
                  'фильтры',
                  style: textStyle,
                ),
              ],
              width: 107,
            )
          ],
        ));
  }

  final TextStyle textStyle =
      const TextStyle(color: AppColors.white, fontSize: 14);
}

class FlightDetailsItem extends StatelessWidget {
  const FlightDetailsItem({super.key, this.items, this.width = 50, this.onTap});

  final List<Widget>? items;
  final double width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: width,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: AppColors.grey7),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items != null
                ? List.generate(items!.length, (index) => items![index])
                : []),
      ),
    );
  }
}
