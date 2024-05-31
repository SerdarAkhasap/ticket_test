import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:online_plane_ticket/domain/entities/price_model.dart';

part 'route_model.g.dart';

List<RouteModel> routeModelFromJson(String str) => List<RouteModel>.from(
    json.decode(str).map((x) => RouteModel.fromJson(x)));

@JsonSerializable()
class RouteModel {
 RouteModel({
   required this.id,
   required this.title,
   required this.town,
   required this.price,
});

 final int id;
 final String title;
 final String town;
 final PriceModel price;

 /// Connect the generated [_$PersonFromJson] function to the `fromJson`
 /// factory.
 factory RouteModel.fromJson(Map<String, dynamic> json) => _$RouteModelFromJson(json);

 /// Connect the generated [_$PersonToJson] function to the `toJson` method.
 Map<String, dynamic> toJson() => _$RouteModelToJson(this);

}