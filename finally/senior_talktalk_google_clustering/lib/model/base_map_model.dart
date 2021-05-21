// To parse this JSON data, do
//
//     final dong = dongFromJson(jsonString);

import 'dart:convert';

BaseMapModel dongFromJson(String str) =>
    BaseMapModel.fromJson(json.decode(str));

String dongToJson(BaseMapModel data) => json.encode(data.toJson());

class BaseMapModel {
  BaseMapModel({
    required this.code,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.cnt,
    required this.disp,
  });

  String code;
  String name;
  String longitude;
  String latitude;
  int cnt;
  int disp;

  factory BaseMapModel.fromJson(Map<String, dynamic> json) => BaseMapModel(
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
