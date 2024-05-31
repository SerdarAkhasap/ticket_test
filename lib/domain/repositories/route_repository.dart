import 'package:online_plane_ticket/domain/entities/route_model.dart';
import 'package:online_plane_ticket/domain/entities/ticket_offers_item_model.dart';

abstract class RouteRepository {
  Future<List<RouteModel>> getRoutes();
  Future<List<TicketOffersItemModel>> getTicketOffers();
}