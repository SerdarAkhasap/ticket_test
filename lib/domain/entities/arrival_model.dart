import 'package:json_annotation/json_annotation.dart';

part 'arrival_model.g.dart';

@JsonSerializable()
class ArrivalModel {

  ArrivalModel({
    required this.town,
    required this.date,
    required this.airport
});

  final String town;
  final String date;
  final String airport;

  factory ArrivalModel.fromJson(Map<String, dynamic> json) => _$ArrivalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArrivalModelToJson(this);
}