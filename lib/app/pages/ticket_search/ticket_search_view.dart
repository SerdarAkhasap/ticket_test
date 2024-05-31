import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:online_plane_ticket/app/pages/home/home_controller.dart';
import 'package:online_plane_ticket/app/pages/ticket_search/ticket_item.dart';
import 'package:online_plane_ticket/app/pages/ticket_search/ticket_search_controller.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/app_constants.dart';
import 'package:online_plane_ticket/app/utils/assets.gen.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class TicketSearchView extends StatefulWidget {
  TicketSearchView({super.key});

  @override
  State<TicketSearchView> createState() => _TicketSearchViewState();
}

class _TicketSearchViewState extends State<TicketSearchView> {
  final HomeController homeController = Get.find<HomeController>();

  final TicketSearchController ticketSearchController = Get.find<TicketSearchController>();

  @override
  void initState() {
    ticketSearchController.getTickets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 37,
        child: Container(
          width: 203,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.blueBtn
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Assets.icons.filter.svg(),
              4.w,
              const Text('Фильтр', style: TextStyle(fontSize: 14, color: AppColors.white),),
              16.w,
              Assets.icons.diagram.svg(),
              4.w,
              const Text('График цен', style: TextStyle(fontSize: 14, color: AppColors.white))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            ListTile(
              tileColor: AppColors.grey2,
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: GestureDetector(
                onTap: () => {
                  context.pop()
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.blueBtn,
                ),
              ),
              title: Text(
                '${homeController.controllerFrom.text}-${homeController.controllerTo.text}',
                style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                  '${homeController.fromDate.value.day} ${AppConstants.fullMonths[homeController.fromDate.value.month - 1]}, 1 пассажир',
              style: const TextStyle(fontSize: 14, color: AppColors.grey5),),
            ),
            Expanded(
              child: Obx(
                  () => ListView.builder(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    itemCount: ticketSearchController.ticketsList.length,
                    itemBuilder: (context, index) =>  TicketItem(item: ticketSearchController.ticketsList[index]),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
