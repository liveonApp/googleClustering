import 'package:flutter/material.dart';

class MakerNumberOnly extends StatelessWidget {
  const MakerNumberOnly({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Text('123'), Text('서울시')],
      ),
    );
  }
}
