import 'dart:convert';

import 'package:get/get.dart';
import 'package:online_plane_ticket/data/utils/dio_controller.dart';
import 'package:online_plane_ticket/domain/entities/ticket_model.dart';
import 'package:online_plane_ticket/domain/entities/tickets_model.dart';
import 'package:online_plane_ticket/domain/repositories/ticket_repository.dart';

class DataTicketRepository extends TicketRepository {
  @override
  Future<List<TicketModel>> getTickets() async {
    try {
      final dioController = Get.find<DioController>();
      final response = await dioController.dio.get('/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf');

      if (response.statusCode == 200) {
        final offers = TicketsModel.fromJson(json.decode(response.toString()) as Map<String, dynamic>);
        return offers.tickets;
      }
      return [];
    } catch(e) {
      print(e.toString());
      return [];
    }
  }

}