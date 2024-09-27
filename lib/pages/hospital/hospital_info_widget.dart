import 'package:flutter/material.dart';
import 'package:location_shop/component/top_app_bar_sub.dart';

import '../../common/route_arguments.dart';

class HospitalInfoWidget extends StatefulWidget {
  const HospitalInfoWidget({super.key});


  @override
  State<HospitalInfoWidget> createState() => _HospitalInfoWidgetState();
}


class _HospitalInfoWidgetState extends State<HospitalInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18.10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            contents,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  final String title =
      "TmpInfo";
  final String contents = '''
  Hospital Info ...
  ''';
}
