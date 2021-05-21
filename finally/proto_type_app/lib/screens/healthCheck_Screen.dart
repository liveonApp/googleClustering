import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:proto_type_app/screens/mainScreen.dart';

import 'package:webview_flutter/webview_flutter.dart';

class HealthCheckScreen extends StatefulWidget {
  @override
  _HealthCheckScreenState createState() => _HealthCheckScreenState();
}

class _HealthCheckScreenState extends State<HealthCheckScreen> {
  WebViewController? _controller;

  bool _isLoading = true;

  void _webViewJsAppConfirmCall(JavascriptMessage jsData) {
    Map<String, dynamic> jObjData = jsonDecode(jsData.message);
    print(jObjData);
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
      return Future.value(true);
    }
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
            Container(
              child: WillPopScope(
                onWillPop: () => _goBack(context),
                child: WebView(
                  initialUrl:
                      'https://test-m.seniortalktalk.com/care/carecounsellor?isapp=1',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (webViewController) async {
                    _controller = webViewController;
                  },
                  javascriptChannels: Set.from([
                    JavascriptChannel(
                      name: 'JSAppConfirm',
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
    );
  }
}
