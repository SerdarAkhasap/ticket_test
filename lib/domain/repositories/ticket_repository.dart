import 'package:online_plane_ticket/domain/entities/ticket_model.dart';

abstract class TicketRepository {

  Future<List<TicketModel>> getTickets();
}