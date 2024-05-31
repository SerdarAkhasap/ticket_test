import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  PriceModel({required this.value});
  final double value;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PriceModelToJson(this);

}