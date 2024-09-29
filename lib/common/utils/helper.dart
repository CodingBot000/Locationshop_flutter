
import '../../model/hospital_detail_data.dart';
import '../enums.dart';



Map<int, String> surgeryIdMapper = {
  1000: "Eyes",
  1001: "Nose",
  1002: "bimaxillary operation",
  1003: "liposuction",
  1004: "Hair transplantation",
  2000: "Ulthera",
  2001: "Thermage",
  2002: "InMode",
  2003: "Shrink",
  2004: "Botox",
  2005: "Filler",
  2006: "Skinbooster",
  2007: "Tune face",
};
// Map<String, int> SurgeryIdMapper = {
//   "Eyes": 1000,
//   "Nose": 1001,
//   "bimaxillary operation": 1002,
//   "liposuction": 1003,
//   "Hair transplantation": 1004,
//   "Ulthera": 2000,
//   "Thermage": 2001,
//   "InMode": 2002,
//   "Shrink": 2003,
//   "Botox": 2004,
//   "Filler": 2005,
//   "Skinbooster": 2006,
//   "Tune face": 2007,
// };
//


class SNSInfoResult {
  final SNSIconType linkType;
  final String hyperText;
  String iconImageName = '';
  SNSInfoResult(this.linkType, this.hyperText, this.iconImageName);
}

List<SNSInfoResult> getSNSInfoList(HospitalDetail data)
{
  List<SNSInfoResult> list = [];
  for (var snsValue in SNSIconType.values) {
    if (snsValue != SNSIconType.none) {
      SNSInfoResult snsInfo = getSNSInfo(snsType: snsValue, data: data);
      if (snsInfo.hyperText.isNotEmpty) {
        list.add(snsInfo);
      }
    }
  }
  return list;
}
// assets/images/icons/icon_sns_call.png
SNSInfoResult getSNSInfo({
  required SNSIconType snsType,
  required HospitalDetail data,
}) {
  String hyperText = '';
  String iconImageName = '';
  String path = 'assets/images/icons';
  SNSIconType linkType = SNSIconType.none;

  if (snsType == SNSIconType.kakaotalk && data.kakaotalk.isNotEmpty) {
    hyperText = data.kakaotalk;
    linkType = SNSIconType.kakaotalk;
    iconImageName = '$path/icon_sns_kakaotalk.png';
  } else if (snsType == SNSIconType.tel && data.tel.isNotEmpty) {
    hyperText = data.tel;
    linkType = SNSIconType.tel;
    iconImageName = '$path/icon_sns_call.svg';
  } else if (snsType == SNSIconType.homepage && data.homepage.isNotEmpty) {
    hyperText = data.homepage;
    linkType = SNSIconType.homepage;
    iconImageName = '$path/icon_sns_homepage.svg';
  } else if (snsType == SNSIconType.blog && data.blog.isNotEmpty) {
    hyperText = data.blog;
    linkType = SNSIconType.blog;
    iconImageName = '$path/icon_sns_blog.png';
  } else if (snsType == SNSIconType.facebook && data.facebook.isNotEmpty) {
    hyperText = data.facebook;
    linkType = SNSIconType.facebook;
    iconImageName = '$path/icon_sns_facebook.png';
  } else if (snsType == SNSIconType.instagram && data.instagram.isNotEmpty) {
    hyperText = data.instagram;
    linkType = SNSIconType.instagram;
    iconImageName = '$path/icon_sns_instagram.png';
  } else if (snsType == SNSIconType.snapchat && data.snapchat.isNotEmpty) {
    hyperText = data.snapchat;
    linkType = SNSIconType.snapchat;
    iconImageName = '$path/icon_sns_snapchat.png';
  } else if (snsType == SNSIconType.tiktok && data.tiktok.isNotEmpty) {
    hyperText = data.tiktok;
    linkType = SNSIconType.tiktok;
    iconImageName = '$path/icon_sns_tiktok.png';
  } else if (snsType == SNSIconType.youtube && data.youtube.isNotEmpty) {
    hyperText = data.youtube;
    linkType = SNSIconType.youtube;
    iconImageName = '$path/icon_sns_youtube.svg';
    // } else if (snsType == SNSIconType.MAP && data.map.isNotEmpty) {
    //   hyperText = data.map;
    //   linkType = SNSIconType.MAP;
  } else {
    // NONE
    hyperText = '';
    linkType = SNSIconType.none;
  }

  return SNSInfoResult(linkType, hyperText, iconImageName);
}

