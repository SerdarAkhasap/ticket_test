// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'luggage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LuggageModel _$LuggageModelFromJson(Map<String, dynamic> json) => LuggageModel(
      hasLuggage: json['has_luggage'] as bool,
      price: json['price'] == null
          ? null
          : PriceModel.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LuggageModelToJson(LuggageModel instance) =>
    <String, dynamic>{
      'has_luggage': instance.hasLuggage,
      'price': instance.price,
    };
