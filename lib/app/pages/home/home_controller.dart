import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_plane_ticket/app/utils/app_constants.dart';
import 'package:online_plane_ticket/app/utils/assets.gen.dart';
import 'package:online_plane_ticket/app/utils/utils.dart';
import 'package:online_plane_ticket/data/repositories/data_route_repository.dart';
import 'package:online_plane_ticket/domain/entities/route_model.dart';
import 'package:online_plane_ticket/domain/entities/ticket_offers_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum RouteType { to, from }

class HomeController extends GetxController {
  final routesLoading = false.obs;
  final routesList = <RouteModel>[].obs;
  late final DataRouteRepository dataRouteRepository;
  final SharedPreferences sharedPreferences =
      Get.find(tag: AppConstants.preferences);

  //Text Controllers
  final controllerFrom = TextEditingController();
  final controllerTo = TextEditingController();

  //show icons
  final showAppendIconTo = false.obs;

  //Dates
  final fromDate = DateTime.now().obs;
  final toDate = DateTime.fromMillisecondsSinceEpoch(0).obs;

  //Ticket Offers
  final ticketOffersLoading = false.obs;
  final ticketOffersList = <TicketOffersItemModel>[].obs;

  final List<Widget> images1 = [
    Assets.images.reaper.image(fit: BoxFit.fill),
    Assets.images.couple.image(fit: BoxFit.fill),
    Assets.images.hair.image(fit: BoxFit.fill)
  ];

  @override
  void onInit() async {
    controllerFrom.text =
        sharedPreferences.getString(AppConstants.preferences) ?? '';
    dataRouteRepository = DataRouteRepository();
    routesLoading(true);
    routesList(await dataRouteRepository.getRoutes());
    routesLoading(false);
    super.onInit();
  }

  void saveText(String str) {
    sharedPreferences.setString(AppConstants.preferences, str);
  }

  void setToText(String text) {
    controllerTo.text = text;
    showAppendIconTo(true);
  }

  void swapLocation() {
    String text = controllerFrom.text;
    controllerFrom.text = controllerTo.text;
    controllerTo.text = text;
  }

  bool isToAvailable() {
    return fromDate.value.compareTo(toDate.value) < 0;
  }

  Future<void> showCustomCalendar(BuildContext context, RouteType type) async {
    final date = await showCalendar(context,
        dissmissable: type == RouteType.from ? false : true,
        initialDate: type == RouteType.from
            ? fromDate.value
            : toDate.value.compareTo(fromDate.value) > 0
                ? toDate.value
                : fromDate.value,
      firstDate: type == RouteType.from ? DateTime.now() : fromDate.value
    );
    type == RouteType.from ? fromDate(date ?? fromDate.value) : toDate(date ?? DateTime.fromMillisecondsSinceEpoch(0));
  }

  Future<void> getTicketOffers() async {
    ticketOffersLoading(true);
    ticketOffersList(await dataRouteRepository.getTicketOffers());
    ticketOffersLoading(false);
  }
}
