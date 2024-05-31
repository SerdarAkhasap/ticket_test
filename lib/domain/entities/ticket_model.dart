import 'package:json_annotation/json_annotation.dart';
import 'package:online_plane_ticket/domain/entities/arrival_model.dart';
import 'package:online_plane_ticket/domain/entities/hand_luggage_model.dart';
import 'package:online_plane_ticket/domain/entities/luggage_model.dart';
import 'package:online_plane_ticket/domain/entities/price_model.dart';

part 'ticket_model.g.dart';

@JsonSerializable()
class TicketModel {
  TicketModel(
      {required this.id,
        this.badge,
      required this.price,
      required this.providerName,
      required this.company,
      required this.departure,
      required this.arrival,
      required this.hasTransfer,
      required this.hasVisaTransfer,
      required this.luggage,
      required this.handLuggage,
      required this.isReturnable,
      required this.isExchangeable});

  final int id;
  final String? badge;
  final PriceModel price;
  @JsonKey(name: 'provider_name')
  final String providerName;
  final String company;
  final ArrivalModel departure;
  final ArrivalModel arrival;
  @JsonKey(name: 'has_transfer')
  final bool hasTransfer;
  @JsonKey(name: 'has_visa_transfer')
  final bool hasVisaTransfer;
  final LuggageModel luggage;
  @JsonKey(name: 'hand_luggage')
  final HandLuggageModel handLuggage;
  @JsonKey(name: 'is_returnable')
  final bool isReturnable;
  @JsonKey(name: 'is_exchangable')
  final bool isExchangeable;

  factory TicketModel.fromJson(Map<String, dynamic> json) => _$TicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}
