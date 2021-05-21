import 'package:flutter/material.dart';

Widget menuIconWidget(
    Icon icon, BuildContext context, String txt, Widget screen) {
  return Column(
    children: [
      Ink(
        decoration: ShapeDecoration(
          color: Theme.of(context).primaryColor,
          shape: CircleBorder(),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          icon: icon,
          iconSize: 20.0,
        ),
      ),
      Text(txt)
    ],
  );
}
