import 'package:flutter/material.dart';
import 'package:location_shop/data/event_data.dart';
import 'package:location_shop/data/hospital_detail_data.dart';
import 'package:location_shop/pages/event_screen/event_detail_screen.dart';
import 'package:location_shop/pages/event_screen/event_list_cell.dart';
import 'package:location_shop/server/dump_respository.dart';
import 'package:location_shop/server/dump_server.dart';

import '../../common/route_arguments.dart';
import '../../common/utils/helper.dart';
import '../../component/top_app_bar_sub.dart';

class SnsListWidget extends StatelessWidget {
  const SnsListWidget({super.key, required this.detailData});

  final HospitalDetail detailData;

  @override
  Widget build(BuildContext context) {
    final List<SNSInfoResult> snsList = getSNSInfoList(detailData);
    const localIconPath = 'assets/images/icons/';
    return ListView.builder(
        scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(10),
          itemCount: snsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageLinkerWidget(
              imageName: '$localIconPath${snsList[index].linkType.name}.png',
              link: snsList[index].hyperText
            );
          },
      );
    }

}


class ImageLinkerWidget extends StatelessWidget {
  const ImageLinkerWidget({super.key, required this.imageName, required this.link});

  final String imageName;
  final String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {

      },
      child: Image.asset(
        "assets/images/icons/$imageName",
        width: 50,
        height: 50,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.error,
            size: 50,
            color: Colors.red,
          );
        },
      ),
    );
  }

}