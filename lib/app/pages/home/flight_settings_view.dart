import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:online_plane_ticket/app/components/choose_location_panel.dart';
import 'package:online_plane_ticket/app/components/custom_button.dart';
import 'package:online_plane_ticket/app/components/flight_details_list.dart';
import 'package:online_plane_ticket/app/pages/home/home_controller.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/assets.gen.dart';
import 'package:online_plane_ticket/app/utils/utils.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class FlightSettingsView extends StatefulWidget {
  const FlightSettingsView({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<FlightSettingsView> createState() => _FlightSettingsViewState();
}

class _FlightSettingsViewState extends State<FlightSettingsView> {
  @override
  void initState() {
    widget.homeController.getTicketOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          31.h,
          ChooseLocationPanel(
            onIconClick: () => {context.pop()},
            onAppendIconClickFrom: () => {widget.homeController.swapLocation()},
            mainBackgroundColor: Colors.transparent,
            secondBackgroundColor: AppColors.grey7,
            controllerTo: widget.homeController.controllerTo,
            controllerFrom: widget.homeController.controllerFrom,
            icon: const Icon(Icons.arrow_back),
            readOnlyTo: true,
            readOnlyFrom: true,
            appendIconFrom: Assets.icons.change.svg(),
            appendIconTo: Assets.icons.close.svg(),
          ).sidePad(16),
          13.h,
          FlightDetailsList(),
          12.h,
          Container(
            height: 270,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.grey7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Прямые рельсы',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                8.h,
                Expanded(
                    child: Obx(
                  () => ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            titleAlignment: ListTileTitleAlignment.top,
                            title: Row(
                              children: [
                                Text(
                                  widget.homeController.ticketOffersList[index]
                                      .title,
                                  style: titleTextStyle,
                                ),
                                const Spacer(),
                                Text('${formatPrice(widget.homeController
                                    .ticketOffersList[index].price.value)} ₽ ',
                                  style: const TextStyle(
                                      fontSize: 14, color: AppColors.blueBtn),
                                ),
                                Assets.icons.rubl.svg()
                              ],
                            ),
                            subtitle: Text(
                              widget.homeController.ticketOffersList[index]
                                  .timeRange
                                  .join(" "),
                              style: subTitleTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            leading: CircleAvatar(
                              radius: 12,
                              backgroundColor: colors[index],
                            ),
                          ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: widget.homeController.ticketOffersList.length),
                )),
                // const Divider(),
                // SizedBox(
                //   width: double.infinity,
                //   height: 42,
                //   child: TextButton(
                //     onPressed: () => {},
                //     style: TextButton.styleFrom(
                //       splashFactory: NoSplash.splashFactory,
                //       foregroundColor: Colors.transparent,
                //       surfaceTintColor: Colors.transparent,
                //       overlayColor: Colors.transparent
                //     ),
                //     child: const Text('Показать все', textAlign: TextAlign.center,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.blue),),),
                // )
              ],
            ),
          ).sidePad(16),
          23.h,
          CustomButton(
              width: double.infinity,
              backgroundColor: AppColors.blueBtn,
              height: 42,
              buttonText: 'Посмотреть все билеты',
              textStyle: const TextStyle(fontSize: 16, color: AppColors.white),
              onPressed: () => {context.push('/ticket-search')}).sidePad(16),
        ],
      ),
    );
  }

  final titleTextStyle = const TextStyle(fontSize: 14, color: AppColors.white);

  final subTitleTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      color: AppColors.white);

  final List<Color> colors = [
    AppColors.red,
    AppColors.blue,
    AppColors.white,
  ];
}
