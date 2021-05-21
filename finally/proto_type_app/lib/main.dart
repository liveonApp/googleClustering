import 'package:flutter/material.dart';

import './screens/mainScreen.dart';

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
        primaryColor: Color(0xff4C4C9B),
        accentColor: Color(0xff4DA68B),
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
