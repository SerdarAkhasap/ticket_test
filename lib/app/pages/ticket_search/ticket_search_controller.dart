import 'package:get/get.dart';
import 'package:online_plane_ticket/data/repositories/data_ticket_repository.dart';
import 'package:online_plane_ticket/domain/entities/ticket_model.dart';

class TicketSearchController extends GetxController {

  final ticketsLoading = false.obs;
  final ticketsList = <TicketModel>[].obs;

  late final DataTicketRepository dataTicketRepository;
  @override
  void onInit() {
    dataTicketRepository = DataTicketRepository();
    super.onInit();
  }

  Future<void> getTickets() async {
    ticketsLoading(true);
    ticketsList(await dataTicketRepository.getTickets());
    ticketsLoading(false);
  }

}