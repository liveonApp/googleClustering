// To parse this JSON data, do
//
//     final center = centerFromJson(jsonString);

import 'dart:convert';

Center centerFromJson(String str) => Center.fromJson(json.decode(str));

String centerToJson(Center data) => json.encode(data.toJson());

class Center {
  Center({
    required this.code,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.cnt,
    required this.tel,
    required this.addr1,
    required this.addr2,
    required this.disp,
    required this.premiumKind,
  });

  String code;
  String name;
  String longitude;
  String latitude;
  int cnt;
  String tel;
  String addr1;
  String addr2;
  int disp;
  int premiumKind;

  factory Center.fromJson(Map<String, dynamic> json) => Center(
        code: json["code"],
        name: json["name"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        cnt: json["cnt"],
        tel: json["tel"],
        addr1: json["addr1"],
        addr2: json["addr2"],
        disp: json["disp"],
        premiumKind: json["premium_kind"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "longitude": longitude,
        "latitude": latitude,
        "cnt": cnt,
        "tel": tel,
        "addr1": addr1,
        "addr2": addr2,
        "disp": disp,
        "premium_kind": premiumKind,
      };
}
