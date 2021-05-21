import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proto_type_app/controller/org_controller.dart';
import 'package:proto_type_app/screens/mainScreen.dart';
import 'package:proto_type_app/widgets/item_main_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:geolocator/geolocator.dart';

class SeniorTalkTalkScreen extends StatefulWidget {
  @override
  _SeniorTalkTalkScreenState createState() => _SeniorTalkTalkScreenState();
}

class _SeniorTalkTalkScreenState extends State<SeniorTalkTalkScreen> {
  WebViewController? _controller;
  bool _isLoading = true;
  OrgController controller = OrgController();

  Future _getOrgMainDetails(Map<String, dynamic> mapData) async {
    List<Org> projetcList = await controller.getLists(mapData);
    return projetcList;
  }

  Widget projectWidget(Map<String, dynamic> mapData) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.waiting ||
            !projectSnap.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final list = projectSnap.data as List;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              Org org = list[index];
              return ItemMain(org);
            },
          );
        }
      },
      future: _getOrgMainDetails(mapData),
    );
  }

  void _webViewJsAppConfirmCall(JavascriptMessage jsData) {
    Map<String, dynamic>? mapData = jsonDecode(jsData.message);
    print('js Data:   $mapData');

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: projectWidget(mapData != null ? mapData : {}),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Text('이제야'),
        title: //로그인 및 로고
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('이제야'),
            Text('나야나'),
          ],
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: Stack(children: [
            // Positioned(
            //   bottom: 150.0,
            //   right: 10.0,
            //   child: FloatingActionButton.extended(
            //       onPressed: () async {
            //         await Geolocator.getCurrentPosition().then((value) => {
            //               _positionItems.add(_PositionItem(
            //                   _PositionItemType.position, value.toString()))
            //             });

            //         setState(
            //           () {},
            //         );
            //       },
            //       label: Text("Current Position")),
            // ),
            Container(
              child: WillPopScope(
                onWillPop: () => _goBack(context),
                child: WebView(
                  initialUrl: 'https://test-m.seniortalktalk.com/maps?isapp=1',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (webViewController) async {
                    _controller = webViewController;
                  },
                  javascriptChannels: Set.from([
                    JavascriptChannel(
                      name: 'House2OrgMapListApp',
                      onMessageReceived: _webViewJsAppConfirmCall,
                    ),
                  ]),
                  onPageFinished: (_) async {
                    // final gotCookies =
                    //     await cookieManager.getCookies(widget.url);
                    // for (var item in gotCookies) {
                    //   print('"items: $item');
                    // }
                  },
                  onProgress: (int progress) {
                    print("WebView is loading (progress : $progress%)");
                    if (progress == 100) {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  onPageStarted: (String url) {
                    print('Page started loading: $url');
                  },
                  gestureNavigationEnabled: true,
                ),
              ),
            ),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ]),
        );
      }),
      //floatingActionButton: favoriteButton(),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await _controller!.canGoBack()) {
      _controller!.goBack();
      return Future.value(false);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );

      // showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //           title: Text('앱을 끄시겠습니까?'),
      //           actions: <Widget>[
      //             ElevatedButton(
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //               child: Text('아니오'),
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 SystemNavigator.pop();
      //               },
      //               child: Text('네'),
      //             ),
      //           ],
      //         ));
      return Future.value(true);
    }
  }
}
