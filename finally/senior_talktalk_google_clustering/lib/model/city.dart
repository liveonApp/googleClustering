// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

import 'package:senior_talktalk_google_clustering/model/base_map_model.dart';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City extends BaseMapModel {
  City({
    required this.code,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.cnt,
    required this.disp,
  }) : super(
            code: code,
            name: name,
            longitude: longitude,
            latitude: latitude,
            cnt: cnt,
            disp: disp);

  String code;
  String name;
  String longitude;
  String latitude;
  int cnt;
  int disp;

  factory City.fromJson(Map<String, dynamic> json) => City(
        code: json["code"],
        name: json["name"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        cnt: json["cnt"],
        disp: json["disp"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "longitude": longitude,
        "latitude": latitude,
        "cnt": cnt,
        "disp": disp,
      };
}
