// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketsModel _$TicketsModelFromJson(Map<String, dynamic> json) => TicketsModel(
      tickets: (json['tickets'] as List<dynamic>)
          .map((e) => TicketModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketsModelToJson(TicketsModel instance) =>
    <String, dynamic>{
      'tickets': instance.tickets,
    };
