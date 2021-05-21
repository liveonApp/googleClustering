import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto_type_app/controller/org_controller.dart';

Widget ItemMain(Org org) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 200,
            child: Image.network(
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
    ),
  );
}
