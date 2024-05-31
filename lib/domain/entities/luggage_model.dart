import 'package:json_annotation/json_annotation.dart';
import 'package:online_plane_ticket/domain/entities/price_model.dart';

part 'luggage_model.g.dart';

@JsonSerializable()
class LuggageModel {

  LuggageModel({
    required this.hasLuggage,
    this.price
});

  @JsonKey(name: 'has_luggage')
  final bool hasLuggage;
  final PriceModel? price;

  factory LuggageModel.fromJson(Map<String, dynamic> json) => _$LuggageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LuggageModelToJson(this);
}
