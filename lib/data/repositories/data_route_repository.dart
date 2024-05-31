import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_plane_ticket/data/utils/dio_controller.dart';
import 'package:online_plane_ticket/domain/entities/offers_model.dart';
import 'package:online_plane_ticket/domain/entities/route_model.dart';
import 'package:online_plane_ticket/domain/entities/ticket_offer_model.dart';
import 'package:online_plane_ticket/domain/entities/ticket_offers_item_model.dart';
import 'package:online_plane_ticket/domain/repositories/route_repository.dart';

class DataRouteRepository extends RouteRepository {

  @override
  Future<List<RouteModel>> getRoutes() async {
    try {
      final dioController = Get.find<DioController>();
      final response = await dioController.dio.get('/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd');

      if (response.statusCode == 200) {
        final offers = OffersModel.fromJson(json.decode(response.toString()) as Map<String, dynamic>);
        return offers.offers;
      }

      return [];
    } catch(e) {
      print(e.toString());
      return [];
    }
  }

  @override
  Future<List<TicketOffersItemModel>> getTicketOffers() async{
    try {
      final dioController = Get.find<DioController>();
      final response = await dioController.dio.get('/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017');

      if (response.statusCode == 200) {
        final offers = TicketOfferModel.fromJson(json.decode(response.toString()) as Map<String, dynamic>);
        return offers.ticketOffers.getRange(0, 3).toList();
      }

      return [];
    } catch(e) {
      print(e.toString());
      return [];
    }
  }

}