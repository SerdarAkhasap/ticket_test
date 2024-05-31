import 'package:json_annotation/json_annotation.dart';

part 'hand_luggage_model.g.dart';

@JsonSerializable()
class HandLuggageModel {
  HandLuggageModel({
    required this.hasHandLuggage,
    this.size
});
  @JsonKey(name: 'has_hand_luggage')
  final bool hasHandLuggage;
  final String? size;

  factory HandLuggageModel.fromJson(Map<String, dynamic> json) => _$HandLuggageModelFromJson(json);

  Map<String, dynamic> toJson() => _$HandLuggageModelToJson(this);

}