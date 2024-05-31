import 'package:json_annotation/json_annotation.dart';
import 'package:online_plane_ticket/domain/entities/ticket_offers_item_model.dart';

part 'ticket_offer_model.g.dart';

@JsonSerializable()
class TicketOfferModel {
  TicketOfferModel({ required this.ticketOffers});

  @JsonKey(name: 'tickets_offers')
  final List<TicketOffersItemModel> ticketOffers;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory TicketOfferModel.fromJson(Map<String, dynamic> json) => _$TicketOfferModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TicketOfferModelToJson(this);
}