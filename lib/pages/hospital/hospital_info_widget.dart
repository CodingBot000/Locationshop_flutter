import 'package:flutter/material.dart';
import 'package:location_shop/component/circle_avatar_view.dart';
import 'package:location_shop/data/hospital_detail_data.dart';
import 'package:location_shop/data/hospital_detail_info_desc.dart';

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
          _title("Address"),
          _subDetail(widget.descData.descAddress),
          const SizedBox(height: infoPadding),

          _title("Opening Hour"),
          _subDetail(widget.descData.openingHour),
          const SizedBox(height: infoPadding),

          _title("Facilities"),
          _subDetail(widget.descData.facilities),
          const SizedBox(height: infoPadding),

          if (widget.descData.etc.isNotEmpty) ...[
            _title("etc"),
            _subDetail(widget.descData.etc),
          ],
          const SizedBox(height: infoPadding),

          if (widget.descData.doctors.isNotEmpty) ...[
            _title("doctors"),
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

  Widget _title(String title) => Text(
    title,
    style: TextStyle(fontSize: fonstSizeTitle, fontWeight: FontWeight.bold)
  );

  Widget _subDetail(String content) => Text(
    content,
    style: TextStyle(fontSize: fonstSizeContent),
  );
}
