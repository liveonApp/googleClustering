import 'dart:convert';

import 'package:senior_talktalk_google_clustering/controller/base_controller.dart';
import 'package:senior_talktalk_google_clustering/model/base_map_model.dart';
import 'package:senior_talktalk_google_clustering/model/center.dart';
import 'package:senior_talktalk_google_clustering/model/center_model.dart';

class MapController extends BaseController {
  Future getListsOfOrganization(Map<String, dynamic> jsonData) async {
    //SearchMap data = SearchMap.fromJson(jsonData);

    String result = await httpRequestCaller(jsonData);
    Map<String, dynamic> req = json.decode(result);
    List<dynamic> asd = req['return_data']['result_data']['list'];
    List<BaseMapModel> organizations =
        asd.map((org) => BaseMapModel.fromJson(org)).toList();

    print(organizations);
    return organizations;
  }

  Future getListsOfDetailofOrganization(Map<String, dynamic> jsonData) async {
    //SearchMap data = SearchMap.fromJson(jsonData);

    String result = await httpRequestCaller(jsonData);
    Map<String, dynamic> req = json.decode(result);
    List<dynamic> asd = req['return_data']['result_data']['list'];
    List<DetailCenter> organizations =
        asd.map((org) => DetailCenter.fromJson(org)).toList();

    print(organizations);
    return organizations;
  }
}
