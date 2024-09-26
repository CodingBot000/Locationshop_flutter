// MenuTitle Enum
import 'package:location_shop/server/dump_respository.dart';

import 'init_value.dart';

enum MenuTitleList {
  SURGICAL_PROCEDURE("Surgical procedure"),
  COSMETIC_PROCEDURE("Cosmetic procedure"),
  LOCATION("Location"),
  FAVORITE("Favorite"),
  EVENT("Event"),
  ABOUT_US("About Us");

  final String value;

  const MenuTitleList(this.value);
}

// Surgery Resource Enum
enum SurgeryResList {
  // ACNE("surgery_acne"),
  // BODY("surgery_body"),
  // BOTOX("surgery_botox"),
  // LIFTING("surgery_lifting"),
  // PIGMENTATION("surgery_pigmentation"),
  // PORE("surgery_pore"),
  // SKINBOOSTER("surgery_skinbooster");
  ACNE("acne"),
  BODY("body"),
  BOTOX("botox"),
  LIFTING("lifting"),
  PIGMENTATION("pigmentation"),
  PORE("pore"),
  SKINBOOSTER("skinbooster");
  final String value;

  const SurgeryResList(this.value);

  String get imagePath => DataRepository.surgeryImgMaps[this.value] ?? "";

  static List<String> namesList() {
    return SurgeryResList.values.map((data) => data.value).toList();
  }
}

enum CosmeticResList {
  EYES("eyes"),
  NOSE("nose"),
  BIMAXILLARY_OPERATION("bimaxillary_operation"),
  LIPOSUCTION("liposuction"),
  HAIR_TRANSPLANTATION("hair_transplantation");

  final String value;

  const CosmeticResList(this.value);

  String get imagePath => DataRepository.surgeryImgMaps[this.value] ?? "";

  static List<String> namesList() {
    return CosmeticResList.values.map((data) => data.value).toList();
  }
}

// Recommend Menu Enum
enum RecommendMenu {
  EVENT("EVENT"),
  REVIEW("REVIEW"),
  HOSPITAL("HOSPITAL");

  final String value;

  const RecommendMenu(this.value);

}

// Location Names Enum
enum LocationNames {
  APGUJEONG("APGUJEONG"),
  MYUNGDONG("MYUNGDONG"),
  GANGNAM("GANGNAM"),
  CHUNGDAM("CHUNGDAM"),
  SONGDO("SONGDO"),
  HONGDAE("HONGDAE");

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
