import 'package:flutter/material.dart';
import 'package:location_shop/component/circle_avatar_view.dart';
import 'package:location_shop/component/top_app_bar_sub.dart';
import 'package:location_shop/data/hospital_detail_data.dart';
import 'package:location_shop/data/hospital_detail_info_desc.dart';

import '../../common/route_arguments.dart';
import '../../data/hospital_data.dart';

class HospitalInfoWidget extends StatefulWidget {
  const HospitalInfoWidget({super.key, required this.detaildata, required this.descData});

  // final HospitalData data;
  final HospitalDetail detaildata;
  final DetailHospitalInfoDesc descData;

  @override
  State<HospitalInfoWidget> createState() => _HospitalInfoWidgetState();
}


class _HospitalInfoWidgetState extends State<HospitalInfoWidget> {
  final double fonstSizeTitle = 20;
  final double fonstSizeContent = 13;

  @override
  Widget build(BuildContext context) {
    const double infoPadding = 10;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18.10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title("Address"),
          _SubDetail(widget.descData.descAddress),
          const SizedBox(height: infoPadding),

          _Title("Opening Hour"),
          _SubDetail(widget.descData.openingHour),
          const SizedBox(height: infoPadding),

          _Title("Facilities"),
          _SubDetail(widget.descData.facilities),
          const SizedBox(height: infoPadding),

          if (widget.descData.etc.isNotEmpty) ...[
            _Title("etc"),
            _SubDetail(widget.descData.etc),
          ],
          const SizedBox(height: infoPadding),

          if (widget.descData.doctors.isNotEmpty) ...[
            _Title("doctors"),
            Wrap(
              spacing: 10,
              children: widget.descData.doctors
                  .map((data) => CircleAvatarViewWidget(fileName: data))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _Title(String title) => Text(
    title,
    style: TextStyle(fontSize: fonstSizeTitle, fontWeight: FontWeight.bold)
  );

  Widget _SubDetail(String content) => Text(
    content,
    style: TextStyle(fontSize: fonstSizeContent),
  );
}
