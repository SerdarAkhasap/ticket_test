// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_offers_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOffersItemModel _$TicketOffersItemModelFromJson(
        Map<String, dynamic> json) =>
    TicketOffersItemModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      timeRange: (json['time_range'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketOffersItemModelToJson(
        TicketOffersItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'time_range': instance.timeRange,
      'price': instance.price,
    };
