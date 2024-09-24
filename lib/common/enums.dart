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
  ACNE("surgery_acne"),
  BODY("surgery_body"),
  BOTOX("surgery_botox"),
  LIFTING("surgery_lifting"),
  PIGMENTATION("surgery_pigmentation"),
  PORE("surgery_pore"),
  SKINBOOSTER("surgery_skinbooster");

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
enum RecommendMenu { EVENT, REVIEW, HOSPITAL }

// Location Names Enum
enum LocationNames {
  APGUJEONG("APGUJEONG"),
  MYUNGDONG("MYUNGDONG"),
  GANGNAM("GANGNAM"),
  CHUNGDAM("CHUNGDAM"),
  SONGDO("SONGDO"),
  HONGDAE("HONGDAE");

  final String value;

  const LocationNames(this.value);

  static List<String> namesList() {
    return LocationNames.values.map((data) => data.value).toList();
  }
}
