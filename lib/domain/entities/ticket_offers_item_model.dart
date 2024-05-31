import 'package:json_annotation/json_annotation.dart';
import 'package:online_plane_ticket/domain/entities/price_model.dart';

part 'ticket_offers_item_model.g.dart';

@JsonSerializable()
class TicketOffersItemModel {

  TicketOffersItemModel({
    required this.id,
    required this.title,
    required this.timeRange,
    required this.price
});

  final int id;
  final String title;
  @JsonKey(name: 'time_range')
  final List<String> timeRange;
  final PriceModel price;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory TicketOffersItemModel.fromJson(Map<String, dynamic> json) => _$TicketOffersItemModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TicketOffersItemModelToJson(this);
}