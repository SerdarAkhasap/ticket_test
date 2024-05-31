import 'package:json_annotation/json_annotation.dart';
import 'package:online_plane_ticket/domain/entities/ticket_model.dart';

part 'tickets_model.g.dart';

@JsonSerializable()
class TicketsModel {
  TicketsModel({
    required this.tickets
});
  final List<TicketModel> tickets;

  factory TicketsModel.fromJson(Map<String, dynamic> json) => _$TicketsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsModelToJson(this);
}