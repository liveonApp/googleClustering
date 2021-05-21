import 'dart:convert';

import 'package:proto_type_app/controller/base_controller.dart';

class OrgController extends BaseController {
  Future getLists(Map<String, dynamic> jsonData) async {
    //SearchMap data = SearchMap.fromJson(jsonData);
    String result = await httpRequestCaller(jsonData);
    Map<String, dynamic> req = json.decode(result);
    List<dynamic> asd = req['return_data']['result_data']['list'];
    List<Org> organizations = asd.map((org) => Org.fromJson(org)).toList();

    print(organizations);
    return organizations;
  }
}

class Org {
  Org({
    required this.orgKey,
    required this.orgId,
    required this.orgName,
    required this.geoPointX,
    required this.geoPointY,
    required this.cnt,
    required this.orgTypeCd,
    required this.orgTypeNm,
    required this.premiumKind,
    required this.tel,
    required this.addr1,
    required this.addr2,
    required this.dongCode,
    required this.gugunCode,
    required this.sidoCode,
    required this.orgEvaluate,
    required this.orgSize,
    required this.viewCnt,
    required this.orgSizeNm,
    required this.orgSpecialtyCd,
    required this.orgSpecialtyNm,
    required this.orgSpecialty2Nm,
    required this.orgKindNm,
    required this.orgCareCertifyYn,
    required this.imageMainFid,
    required this.reviewRate,
    required this.reviewCnt,
    required this.orgPTxt1,
    required this.movieMain,
  });

  int orgKey;
  String orgId;
  String orgName;
  String geoPointX;
  String geoPointY;
  int cnt;
  String orgTypeCd;
  String orgTypeNm;
  dynamic premiumKind;
  String tel;
  String addr1;
  String addr2;
  String dongCode;
  String gugunCode;
  String sidoCode;
  String orgEvaluate;
  String orgSize;
  int viewCnt;
  String orgSizeNm;
  String orgSpecialtyCd;
  String orgSpecialtyNm;
  String orgSpecialty2Nm;
  String orgKindNm;
  String orgCareCertifyYn;
  int imageMainFid;
  String reviewRate;
  int reviewCnt;
  dynamic orgPTxt1;
  dynamic movieMain;

  factory Org.fromJson(Map<String, dynamic> json) => Org(
        orgKey: json["org_key"],
        orgId: json["org_id"],
        orgName: json["org_name"],
        geoPointX: json["geo_pointX"],
        geoPointY: json["geo_pointY"],
        cnt: json["cnt"],
        orgTypeCd: json["org_type_cd"],
        orgTypeNm: json["org_type_nm"],
        premiumKind: json["premium_kind"],
        tel: json["tel"],
        addr1: json["addr1"],
        addr2: json["addr2"],
        dongCode: json["dong_code"],
        gugunCode: json["gugun_code"],
        sidoCode: json["sido_code"],
        orgEvaluate: json["org_evaluate"],
        orgSize: json["org_size"],
        viewCnt: json["view_cnt"],
        orgSizeNm: json["org_size_nm"],
        orgSpecialtyCd: json["org_specialty_cd"],
        orgSpecialtyNm: json["org_specialty_nm"],
        orgSpecialty2Nm: json["org_specialty2_nm"],
        orgKindNm: json["org_kind_nm"],
        orgCareCertifyYn: json["org_care_certify_yn"],
        imageMainFid: json["image_main_fid"],
        reviewRate: json["review_rate"],
        reviewCnt: json["review_cnt"],
        orgPTxt1: json["org_p_txt1"],
        movieMain: json["movie_main"],
      );

  Map<String, dynamic> toJson() => {
        "org_key": orgKey,
        "org_id": orgId,
        "org_name": orgName,
        "geo_pointX": geoPointX,
        "geo_pointY": geoPointY,
        "cnt": cnt,
        "org_type_cd": orgTypeCd,
        "org_type_nm": orgTypeNm,
        "premium_kind": premiumKind,
        "tel": tel,
        "addr1": addr1,
        "addr2": addr2,
        "dong_code": dongCode,
        "gugun_code": gugunCode,
        "sido_code": sidoCode,
        "org_evaluate": orgEvaluate,
        "org_size": orgSize,
        "view_cnt": viewCnt,
        "org_size_nm": orgSizeNm,
        "org_specialty_cd": orgSpecialtyCd,
        "org_specialty_nm": orgSpecialtyNm,
        "org_specialty2_nm": orgSpecialty2Nm,
        "org_kind_nm": orgKindNm,
        "org_care_certify_yn": orgCareCertifyYn,
        "image_main_fid": imageMainFid,
        "review_rate": reviewRate,
        "review_cnt": reviewCnt,
        "org_p_txt1": orgPTxt1,
        "movie_main": movieMain,
      };
}

class SearchMap {
  SearchMap({
    required this.orgTypeKind,
    required this.orgSpecial,
    required this.orgEvaluate,
    required this.orgSize,
    required this.orgExpense,
    required this.orgSocial,
    required this.waitCount,
    required this.orgGeo,
    required this.target,
    required this.module,
    required this.action,
    required this.limitOffset,
    required this.limitCount,
    required this.geoCenterX,
    required this.geoCenterY,
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
  String module;
  String action;
  int limitOffset;
  int limitCount;
  double geoCenterX;
  double geoCenterY;
  double geoMinX;
  double geoMinY;
  double geoMaxX;
  double geoMaxY;
  int geoLevel;
  String searchValue;

  factory SearchMap.fromJson(Map<String, dynamic> json) => SearchMap(
        orgTypeKind: json["org_type_kind"],
        orgSpecial: json["org_special"],
        orgEvaluate: json["org_evaluate"],
        orgSize: json["org_size"],
        orgExpense: json["org_expense"],
        orgSocial: json["org_social"],
        waitCount: json["waitCount"],
        orgGeo: json["org_geo"],
        target: json["target"],
        module: json["module"],
        action: json["action"],
        limitOffset: json["limit_offset"],
        limitCount: json["limit_count"],
        geoCenterX: json["geo_centerX"].toDouble(),
        geoCenterY: json["geo_centerY"].toDouble(),
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
        "module": module,
        "action": action,
        "limit_offset": limitOffset,
        "limit_count": limitCount,
        "geo_centerX": geoCenterX,
        "geo_centerY": geoCenterY,
        "geo_minX": geoMinX,
        "geo_minY": geoMinY,
        "geo_maxX": geoMaxX,
        "geo_maxY": geoMaxY,
        "geo_level": geoLevel,
        "searchValue": searchValue,
      };
}
