// To parse this JSON data, do
//
//     final center = centerFromJson(jsonString);

import 'dart:convert';

DetailCenter centerFromJson(String str) =>
    DetailCenter.fromJson(json.decode(str));

String centerToJson(DetailCenter data) => json.encode(data.toJson());

class DetailCenter {
  DetailCenter({
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

  factory DetailCenter.fromJson(Map<String, dynamic> json) => DetailCenter(
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
        orgSpecialtyCd:
            json["org_specialty_cd"] == null ? "" : json["org_specialty_cd"],
        orgSpecialtyNm:
            json["org_specialty_nm"] == null ? "" : json["org_specialty_nm"],
        orgSpecialty2Nm:
            json["org_specialty2_nm"] == null ? "" : json["org_specialty2_nm"],
        orgKindNm: json["org_kind_nm"],
        orgCareCertifyYn: json["org_care_certify_yn"],
        imageMainFid:
            json["image_main_fid"] == null ? 0 : json["image_main_fid"],
        reviewRate: json["review_rate"],
        reviewCnt: json["review_cnt"] == null ? 0 : json["review_cnt"],
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
