import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:senior_talktalk_google_clustering/controller/map_controller.dart';
import 'package:senior_talktalk_google_clustering/model/base_map_model.dart';
import 'package:senior_talktalk_google_clustering/model/center_model.dart';
import 'package:senior_talktalk_google_clustering/model/city.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapClusteringSample(),
    );
  }
}

class MapClusteringSample extends StatefulWidget {
  @override
  State<MapClusteringSample> createState() => MapClusteringSampleState();
}

class MapClusteringSampleState extends State<MapClusteringSample> {
  late ClusterManager _manager;

  Completer<GoogleMapController> _comController = Completer();
  Set<Marker> markers = Set();
  List<ClusterItem<BaseMapModel>> items = [];
  final CameraPosition _parisCameraPosition =
      CameraPosition(target: LatLng(37.5665, 126.9780), zoom: 12.0);
  Map<String, dynamic>? mapData;
  GoogleMapController? _controller;
  double geoLv = 13;
  int page = 1;

  double geo_centerX = 126.9463795051084;
  double geo_centerY = 35.90358091214152;
  double? geo_minX;
  double? geo_minY;
  double? geo_maxX;
  double? geo_maxY;

  getMapData(double centerX, double centerY, double minX, double minY,
      double maxX, double maxY, int getLevel, bool isDetail) {
    Map<String, dynamic> initialMapData;

    initialMapData = {
      "org_type_kind": "101010",
      "org_special": "",
      "org_evaluate": "",
      "org_size": "",
      "org_expense": "",
      "org_social": "",
      "waitCount": "",
      "org_geo": "",
      "target": "orgsearch",
      "action": "search",
      "limit_offset": isDetail ? page * 12 : 0,
      "limit_count": isDetail ? 12 : 9999,
      "geo_centerX": centerX,
      "geo_centerY": centerY,
      "module": "map",
      "geo_minX": minX,
      "geo_minY": minY,
      "geo_maxX": maxX,
      "geo_maxY": maxY,
      "geo_level": isDetail ? 0 : getLevel,
      "searchValue": ""
    };
    mapData = initialMapData;
  }

  Future _getListofOrganization() async {
    items.clear();

    List<BaseMapModel> listOfOrg =
        await MapController().getListsOfOrganization(mapData!);
    addItems(listOfOrg);
    _manager.setItems(items);
  }

  Future _getListofDetailOfOrganization() async {
    //센터 디테일 Map 데이터 셋팅
    getMapData(geo_centerX, geo_centerY, geo_minX!, geo_minY!, geo_maxX!,
        geo_maxY!, 0, true);
    List<DetailCenter> listOfDetailOfOrg =
        await MapController().getListsOfDetailofOrganization(mapData!);
    return listOfDetailOfOrg;
  }

  addItems(List<BaseMapModel> resData) async {
    for (int i = 0; i < resData.length; i++) {
      items.add(ClusterItem(
          LatLng(double.parse(resData[i].latitude),
              double.parse(resData[i].longitude)),
          item: City(
              code: resData[i].code,
              name: resData[i].name,
              longitude: resData[i].longitude,
              latitude: resData[i].latitude,
              cnt: resData[i].cnt,
              disp: resData[i].disp)));
    }
  }

  @override
  void initState() {
    double geo_centerX = 127.02461912516985;
    double geo_centerY = 37.532955033181416;

    double geo_minX = 126.57086248774714;
    double geo_minY = 37.29950048245752;
    double geo_maxX = 127.4812020007605;
    double geo_maxY = 37.76464508689191;

    getMapData(geo_centerX, geo_centerY, geo_minX, geo_minY, geo_maxX, geo_maxY,
        13, false);
    _getListofOrganization();
    _manager = _initClusterManager();

    super.initState();
  }

  int zoomMatching(double googleLv) {
    int result = 0;

    if (googleLv >= 14) result = 7;
    if (googleLv <= 13) result = 8;
    if (googleLv <= 12) result = 10;
    if (googleLv <= 10) result = 12;

    return result;
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<BaseMapModel>(
      items,
      _updateMarkers,
      markerBuilder: _markerBuilder,
      initialZoom: _parisCameraPosition.zoom,
      stopClusteringZoom: 7,
    );
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }

  Widget _body() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _parisCameraPosition,
      markers: markers,
      onMapCreated: (GoogleMapController controller) async {
        _controller = controller;

        _comController.complete(controller);
        _manager.setMapController(controller);
      },
      onCameraMove: (CameraPosition position) {
        //줌 double 값일때 작동 안되야 함
        print(position.zoom);
        setState(() {
          geoLv = position.zoom;
        });
        _manager.onCameraMove(position);
      },
      onCameraIdle: () async {
        LatLngBounds bounds = await _controller!.getVisibleRegion();
        print('northease ${bounds.northeast}');
        print('southwest ${bounds.southwest}');

        geo_centerX = 126.9463795051084;
        geo_centerY = 35.90358091214152;
        geo_minX = bounds.southwest.longitude;
        geo_minY = bounds.southwest.latitude;
        geo_maxX = bounds.northeast.longitude;
        geo_maxY = bounds.northeast.latitude;

        int matchedGeoLv = zoomMatching(geoLv);
        setState(() {
          getMapData(geo_centerX, geo_centerY, geo_minX!, geo_minY!, geo_maxX!,
              geo_maxY!, matchedGeoLv, false);
        });
        _getListofOrganization();
        // ignore: unnecessary_statements

        _manager.updateMarkers(markers);
        //_manager.updateMap();
      },
    );
  }

  // Future _getOrgMainDetails(Map<String, dynamic> mapData) async {
  //  return await MapController().getListsOfDetailofOrganization(initialMapData);
  // }

  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 30.0;
  bool isScrollable = true;
  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .50;
    return new Scaffold(
      body: SlidingUpPanel(
        backdropEnabled: true,
        isDraggable: isScrollable,
        maxHeight: _panelHeightOpen,
        minHeight: _panelHeightClosed,
        parallaxEnabled: true,
        parallaxOffset: .5,
        body: _body(),
        panelBuilder: (sc) => _panel(sc),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        onPanelSlide: (double pos) => setState(() {
          isScrollable = false;
          _fabHeight =
              pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
        }),
        onPanelClosed: () {
          setState(() {
            isScrollable = true;
          });
        },
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                '센터 리스트 보기',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: FutureBuilder(
                builder: (context, projectSnap) {
                  if (projectSnap.connectionState == ConnectionState.waiting ||
                      !projectSnap.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final list = projectSnap.data as List;
                    return ListView.builder(
                      primary: true,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        DetailCenter org = list[index];
                        return ItemMain(org);
                      },
                    );
                  }
                },
                future: _getListofDetailOfOrganization(),
              ),
            ),
          ],
        ));
  }

  Widget ItemMain(DetailCenter org) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 200,
            child: org.imageMainFid == 0
                ? Image.network(
                    'https://test-m.seniortalktalk.com/images/org_default.jpg',
                    fit: BoxFit.fitWidth,
                  )
                : Image.network(
                    'https://test-files.seniortalktalk.com/images3/${org.imageMainFid}',
                    fit: BoxFit.fitWidth,
                  ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${org.orgSizeNm} ${org.orgTypeNm}'),
                Text('${org.orgName}'),
                Text('${org.addr1}'),
                Text('${org.tel}'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<Marker> Function(Cluster<BaseMapModel>) get _markerBuilder =>
      (cluster) async {
        return Marker(
            markerId: MarkerId(cluster.getId()),
            position: cluster.location,
            onTap: () {
              print('---- $cluster');
              cluster.items.forEach((p) => print(p));
            },
            icon: await _getMarkerBitmap(
                cluster.isMultiple ? 100 : 120,
                cluster.isMultiple ? cluster.count.toString() : null,
                cluster.items.map((e) => e!.name).toString(),
                cluster.items.map((e) => e!.cnt).toString()));
      };

  Future<BitmapDescriptor> _getMarkerBitmap(
      int size, String? count, String? name, String cnt) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    Paint paint = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Colors.deepPurpleAccent // 색은 보라색
      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
      ..strokeWidth = 10.0; // 선의 굵기는 4.0

    // canvas.drawRect(Offset(100, 100) & const Size(200, 150), paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);

    if (cnt == '(1)' && geoLv >= 14) {
      painter.text = TextSpan(
        children: [
          TextSpan(
            text: name,
            style: TextStyle(color: Colors.white),
          )
        ],
        // text: text,
        style: TextStyle(fontSize: size / 8, fontWeight: FontWeight.bold),
      );
    } else {
      painter.text = TextSpan(
        children: [
          TextSpan(
            text: '$cnt',
            style: TextStyle(color: Colors.white),
          )
        ],
        // text: text,
        style: TextStyle(fontSize: size / 5, fontWeight: FontWeight.bold),
      );
    }
    painter.layout();

    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
