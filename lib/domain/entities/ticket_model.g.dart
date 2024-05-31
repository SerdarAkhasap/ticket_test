// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      id: (json['id'] as num).toInt(),
      badge: json['badge'] as String?,
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      providerName: json['provider_name'] as String,
      company: json['company'] as String,
      departure:
          ArrivalModel.fromJson(json['departure'] as Map<String, dynamic>),
      arrival: ArrivalModel.fromJson(json['arrival'] as Map<String, dynamic>),
      hasTransfer: json['has_transfer'] as bool,
      hasVisaTransfer: json['has_visa_transfer'] as bool,
      luggage: LuggageModel.fromJson(json['luggage'] as Map<String, dynamic>),
      handLuggage: HandLuggageModel.fromJson(
          json['hand_luggage'] as Map<String, dynamic>),
      isReturnable: json['is_returnable'] as bool,
      isExchangeable: json['is_exchangable'] as bool,
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'badge': instance.badge,
      'price': instance.price,
      'provider_name': instance.providerName,
      'company': instance.company,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'has_transfer': instance.hasTransfer,
      'has_visa_transfer': instance.hasVisaTransfer,
      'luggage': instance.luggage,
      'hand_luggage': instance.handLuggage,
      'is_returnable': instance.isReturnable,
      'is_exchangable': instance.isExchangeable,
    };
