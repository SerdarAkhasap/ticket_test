// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOfferModel _$TicketOfferModelFromJson(Map<String, dynamic> json) =>
    TicketOfferModel(
      ticketOffers: (json['tickets_offers'] as List<dynamic>)
          .map((e) => TicketOffersItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketOfferModelToJson(TicketOfferModel instance) =>
    <String, dynamic>{
      'tickets_offers': instance.ticketOffers,
    };
