import 'package:online_plane_ticket/domain/entities/route_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offers_model.g.dart';

@JsonSerializable()
class OffersModel {
  OffersModel({required this.offers});

  final List<RouteModel> offers;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory OffersModel.fromJson(Map<String, dynamic> json) => _$OffersModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OffersModelToJson(this);
}
