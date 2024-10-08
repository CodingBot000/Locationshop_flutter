import 'package:location_shop/common/init_value.dart';

enum MenuTitleList {
  surgicalProcedure("Surgical procedure"),
  cosmeticProcedure("Cosmetic procedure"),
  location("Location"),
  favorite("Favorite"),
  event("Event"),
  aboutUs("About Us");

  final String value;

  const MenuTitleList(this.value);
}

enum SurgeryResList {

  acne("acne"),
  body("body"),
  botox("botox"),
  lifting("lifting"),
  pigmentation("pigmentation"),
  pore("pore"),
  skinBooster("skinbooster");
  final String value;

  const SurgeryResList(this.value);

  String get imagePath => InitValue.surgeryImgMaps[value] ?? "";

  static List<String> namesList() {
    return SurgeryResList.values.map((data) => data.value).toList();
  }
}

enum CosmeticResList {
  eyes("eyes"),
  nose("nose"),
  bimaxillaryOperation("bimaxillary_operation"),
  liposuction("liposuction"),
  hairTransplantation("hair_transplantation");

  final String value;

  const CosmeticResList(this.value);

  String get imagePath => InitValue.surgeryImgMaps[value] ?? "";

  static List<String> namesList() {
    return CosmeticResList.values.map((data) => data.value).toList();
  }
}

// Recommend Menu Enum
enum RecommendMenu {
  event("EVENT"),
  review("REVIEW"),
  hospital("HOSPITAL");

  final String value;

  const RecommendMenu(this.value);
}

// Location Names Enum
enum LocationNames {
  ApguJeong("APGUJEONG"),
  MyungDong("MYUNGDONG"),
  GangNam("GANGNAM"),
  ChungDam("CHUNGDAM"),
  SongDo("SONGDO"),
  HongDae("HONGDAE");

  static const Map<String, String> locationMap = {
    'APGUJEONG': "0",
    'MYUNGDONG': "1",
    'GANGNAM': "2",
    'CHUNGDAM': "3",
    'SONGDO': "4",
    'HONGDAE': "5",
  };

  final String value;

  const LocationNames(this.value);

  static String getId(String locationName) {
    return locationMap[locationName] ?? "0";
  }

  static List<String> namesList() {
    return LocationNames.values.map((data) => data.value).toList();
  }
}

enum SNSIconType {
  none("NONE"),
  kakaotalk("KAKAOTALK"),
  tel("TEL"),
  homepage("HOMEPAGE"),
  instagram("INSTAGRAM"),
  facebook("FACEBOOK"),
  blog("BLOG"),
  youtube("YOUTUBE"),
  tiktok("TIKTOK"),
  snapchat("SNAPCHAT"),
  map("MAP");

  final String value;

  const SNSIconType(this.value);
}