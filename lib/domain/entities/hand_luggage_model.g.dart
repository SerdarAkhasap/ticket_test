// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hand_luggage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandLuggageModel _$HandLuggageModelFromJson(Map<String, dynamic> json) =>
    HandLuggageModel(
      hasHandLuggage: json['has_hand_luggage'] as bool,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$HandLuggageModelToJson(HandLuggageModel instance) =>
    <String, dynamic>{
      'has_hand_luggage': instance.hasHandLuggage,
      'size': instance.size,
    };
