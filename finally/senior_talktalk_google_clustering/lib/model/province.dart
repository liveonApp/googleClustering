// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

import 'package:senior_talktalk_google_clustering/model/base_map_model.dart';

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

String provinceToJson(Province data) => json.encode(data.toJson());

class Province extends BaseMapModel {
  Province({
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

  factory Province.fromJson(Map<String, dynamic> json) => Province(
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
