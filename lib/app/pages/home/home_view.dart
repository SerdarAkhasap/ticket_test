import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:online_plane_ticket/app/components/choose_location_panel.dart';
import 'package:online_plane_ticket/app/components/horizontal_list.dart';
import 'package:online_plane_ticket/app/components/route_button.dart';
import 'package:online_plane_ticket/app/pages/home/home_controller.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/assets.gen.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          24.h,
          const Text(
            'Поиск дешевых авиабилетов',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.grey6),
          ).sidePad(94),
          24.h,
          ChooseLocationPanel(
            onSubmittedFrom: (str) => {homeController.saveText(str)},
            onTapTo: () => {openModal(context)},
            icon: Assets.icons.search
                .svg(width: 24, height: 24, color: AppColors.black),
            readOnlyTo: true,
            controllerFrom: homeController.controllerFrom,
          ).sidePad(16),
          32.h,
          Obx(() => HorizontalList(
                title: 'Музыкально отлететь',
                items: homeController.routesList.toList(),
                images: homeController.images1,
              )),
          15.h,
        ],
      ),
    );
  }

  void openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: AppColors.grey2),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 38,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.grey4),
                    ),
                    24.h,
                    Obx(
                      () => ChooseLocationPanel(
                        mainBackgroundColor: Colors.transparent,
                        secondBackgroundColor: AppColors.grey7,
                        prependIconFrom: Assets.icons.airplane.svg(),
                        prependIconTo: Assets.icons.search.svg(),
                        controllerFrom: homeController.controllerFrom,
                        controllerTo: homeController.controllerTo,
                        readOnlyFrom: true,
                        onChangedTo: (s) => {
                          if (homeController.controllerTo.text.isEmpty)
                            homeController.showAppendIconTo(false)
                          else if (!homeController.showAppendIconTo.value)
                            homeController.showAppendIconTo(true)
                        },
                        appendIconTo: homeController.showAppendIconTo.value
                            ? Assets.icons.close.svg()
                            : null,
                        onAppendIconClickTo: () => {
                          homeController.controllerTo.text = '',
                          homeController.showAppendIconTo(false)
                        },
                      ),
                    ),
                    24.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RouteButton(
                          onTap: () => {context.push('/stub')},
                          title: 'Сложный маршрут',
                          icon: Assets.icons.routes.svg(),
                          backgroundColor: AppColors.darkGreen,
                        ),
                        RouteButton(
                          onTap: () => {
                            homeController.setToText('Куда угодно'),
                          },
                          title: 'Куда угодно',
                          icon: Assets.icons.global.svg(),
                          backgroundColor: AppColors.blue,
                        ),
                        RouteButton(
                          onTap: () => {context.push('/stub')},
                          title: 'Выходные',
                          icon: Assets.icons.calendar.svg(),
                          backgroundColor: AppColors.darkBlue,
                        ),
                        RouteButton(
                          onTap: () => {context.push('/stub')},
                          title: 'Горячие билеты',
                          icon: Assets.icons.fire.svg(),
                          backgroundColor: AppColors.red,
                        ),
                      ],
                    ),
                    30.h,
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.grey7,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () => {
                              homeController.setToText('Стамбул'),
                              Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () => {
                                        context.go('/flight-settings',
                                            extra: homeController)
                                      })
                            },
                            contentPadding: EdgeInsets.zero,
                            title: Text('Стамбул', style: titleTextStyle),
                            subtitle: Text(
                              'Популярное направление',
                              style: subTitleTextStyle,
                            ),
                            dense: true,
                            leading: SizedBox(
                              width: 40,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child:
                                    Assets.images.wecer.image(fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () => {
                              homeController.setToText('Сочи'),
                              Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () => {
                                        context.go('/flight-settings',
                                            extra: homeController)
                                      })
                            },
                            contentPadding: EdgeInsets.zero,
                            title: Text('Сочи', style: titleTextStyle),
                            subtitle: Text(
                              'Популярное направление',
                              style: subTitleTextStyle,
                            ),
                            dense: true,
                            leading: SizedBox(
                              width: 40,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Assets.images.seaThumbnail
                                    .image(fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () => {
                              homeController.setToText('Пхукет'),
                              Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () => {
                                        context.go('/flight-settings',
                                            extra: homeController)
                                      })
                            },
                            contentPadding: EdgeInsets.zero,
                            title: Text('Пхукет', style: titleTextStyle),
                            subtitle: Text(
                              'Популярное направление',
                              style: subTitleTextStyle,
                            ),
                            dense: true,
                            leading: SizedBox(
                              width: 40,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Assets.images.pureWater
                                    .image(fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  final titleTextStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white);
  final subTitleTextStyle = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.grey4);

}
