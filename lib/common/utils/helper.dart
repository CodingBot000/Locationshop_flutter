
import '../../data/hospital_detail_data.dart';
import '../enums.dart';



Map<int, String> SurgeryIdMapper = {
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

  SNSInfoResult(this.linkType, this.hyperText);
}

List<SNSInfoResult> getSNSInfoList(HospitalDetail data)
{
  List<SNSInfoResult> list = [];
  for (var snsValue in SNSIconType.values) {
    if (snsValue != SNSIconType.NONE) {
      list.add(getSNSInfo(snsType: snsValue, data: data));
    }
  }
  return list;
}

SNSInfoResult getSNSInfo({
  required SNSIconType snsType,
  required HospitalDetail data,
}) {
  String hyperText = '';
  SNSIconType linkType = SNSIconType.NONE;

  if (snsType == SNSIconType.KAKAOTALK && data.kakaotalk.isNotEmpty) {
    hyperText = data.kakaotalk;
    linkType = SNSIconType.KAKAOTALK;
  } else if (snsType == SNSIconType.TEL && data.tel.isNotEmpty) {
    hyperText = data.tel;
    linkType = SNSIconType.TEL;
  } else if (snsType == SNSIconType.HOMEPAGE && data.homepage.isNotEmpty) {
    hyperText = data.homepage;
    linkType = SNSIconType.HOMEPAGE;
  } else if (snsType == SNSIconType.BLOG && data.blog.isNotEmpty) {
    hyperText = data.blog;
    linkType = SNSIconType.BLOG;
  } else if (snsType == SNSIconType.FACEBOOK && data.facebook.isNotEmpty) {
    hyperText = data.facebook;
    linkType = SNSIconType.FACEBOOK;
  } else if (snsType == SNSIconType.INSTAGRAM && data.instagram.isNotEmpty) {
    hyperText = data.instagram;
    linkType = SNSIconType.INSTAGRAM;
  } else if (snsType == SNSIconType.SNAPCHAT && data.snapchat.isNotEmpty) {
    hyperText = data.snapchat;
    linkType = SNSIconType.SNAPCHAT;
  } else if (snsType == SNSIconType.TIKTOK && data.tiktok.isNotEmpty) {
    hyperText = data.tiktok;
    linkType = SNSIconType.TIKTOK;
  } else if (snsType == SNSIconType.YOUTUBE && data.youtube.isNotEmpty) {
    hyperText = data.youtube;
    linkType = SNSIconType.YOUTUBE;
    // } else if (snsType == SNSIconType.MAP && data.map.isNotEmpty) {
    //   hyperText = data.map;
    //   linkType = SNSIconType.MAP;
  } else {
    // NONE
    hyperText = '';
    linkType = SNSIconType.NONE;
  }

  return SNSInfoResult(linkType, hyperText);
}
