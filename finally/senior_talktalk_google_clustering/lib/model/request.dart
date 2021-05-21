import 'dart:convert';

RequestMapData centerReqFromJson(String str) =>
    RequestMapData.fromJson(json.decode(str));

String centerReqToJson(RequestMapData data) => json.encode(data.toJson());

class RequestMapData {
  RequestMapData({
    required this.orgTypeKind,
    required this.orgSpecial,
    required this.orgEvaluate,
    required this.orgSize,
    required this.orgExpense,
    required this.orgSocial,
    required this.waitCount,
    required this.orgGeo,
    required this.target,
    required this.action,
    required this.limitOffset,
    required this.limitCount,
    required this.geoCenterX,
    required this.geoCenterY,
    required this.module,
    required this.geoMinX,
    required this.geoMinY,
    required this.geoMaxX,
    required this.geoMaxY,
    required this.geoLevel,
    required this.searchValue,
  });

  String orgTypeKind;
  String orgSpecial;
  String orgEvaluate;
  String orgSize;
  String orgExpense;
  String orgSocial;
  String waitCount;
  String orgGeo;
  String target;
  String action;
  int limitOffset;
  int limitCount;
  double geoCenterX;
  double geoCenterY;
  String module;
  double geoMinX;
  double geoMinY;
  double geoMaxX;
  double geoMaxY;
  int geoLevel;
  String searchValue;

  factory RequestMapData.fromJson(Map<String, dynamic> json) => RequestMapData(
        orgTypeKind: json["org_type_kind"],
        orgSpecial: json["org_special"],
        orgEvaluate: json["org_evaluate"],
        orgSize: json["org_size"],
        orgExpense: json["org_expense"],
        orgSocial: json["org_social"],
        waitCount: json["waitCount"],
        orgGeo: json["org_geo"],
        target: json["target"],
        action: json["action"],
        limitOffset: json["limit_offset"],
        limitCount: json["limit_count"],
        geoCenterX: json["geo_centerX"].toDouble(),
        geoCenterY: json["geo_centerY"].toDouble(),
        module: json["module"],
        geoMinX: json["geo_minX"].toDouble(),
        geoMinY: json["geo_minY"].toDouble(),
        geoMaxX: json["geo_maxX"].toDouble(),
        geoMaxY: json["geo_maxY"].toDouble(),
        geoLevel: json["geo_level"],
        searchValue: json["searchValue"],
      );

  Map<String, dynamic> toJson() => {
        "org_type_kind": orgTypeKind,
        "org_special": orgSpecial,
        "org_evaluate": orgEvaluate,
        "org_size": orgSize,
        "org_expense": orgExpense,
        "org_social": orgSocial,
        "waitCount": waitCount,
        "org_geo": orgGeo,
        "target": target,
        "action": action,
        "limit_offset": limitOffset,
        "limit_count": limitCount,
        "geo_centerX": geoCenterX,
        "geo_centerY": geoCenterY,
        "module": module,
        "geo_minX": geoMinX,
        "geo_minY": geoMinY,
        "geo_maxX": geoMaxX,
        "geo_maxY": geoMaxY,
        "geo_level": geoLevel,
        "searchValue": searchValue,
      };
}
