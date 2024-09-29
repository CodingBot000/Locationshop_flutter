import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location_shop/common/enums.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/utils/helper.dart';

class SnsListWidget extends StatelessWidget {
  const SnsListWidget({super.key, required this.detailData});

  final HospitalDetail detailData;

  @override
  Widget build(BuildContext context) {
    final List<SNSInfoResult> snsList = getSNSInfoList(detailData);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: snsList.map((snsInfo) {

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: GestureDetector(
            onTap: () async => {
                print('snsInfo.hyperText: ${snsInfo.hyperText}'),
              if (snsInfo.linkType == SNSIconType.tel)
                {await launchUrl(Uri(scheme: 'tel', path: snsInfo.hyperText))}
              else
                {
                  await launch(snsInfo.hyperText,
                      forceSafariVC: true, forceWebView: true)
                  // await launchUrl(
                  //     Uri(path: snsInfo.hyperText))
                }
            },
            child: ImageLinkerWidget(
              imageName: snsInfo.iconImageName,
              link: snsInfo.hyperText,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class ImageLinkerWidget extends StatelessWidget {
  const ImageLinkerWidget(
      {super.key, required this.imageName, required this.link});

  final String imageName;
  final String link;

  @override
  Widget build(BuildContext context) {
    // print('imageName: $imageName');
    const double size = 30;
    String extension = '';
    if (imageName.contains('.')) {
      extension = imageName.split('.').last.toLowerCase();
    }

    // 확장자에 따라 다른 위젯을 반환
    if (extension == 'png' || extension == 'jpg' || extension == 'jpeg') {
      return Image.asset(
        imageName,
        width: size,
        height: size,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.error,
            size: size,
            color: Colors.red,
          );
        },
      );
    } else {
      // svg
      return SvgPicture.asset(
        imageName,
        width: size,
        height: size,
      );
    }
  }
}
