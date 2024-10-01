
import '../model/chip_location_data.dart';
import '../model/home_banner_data.dart';
import '../repository/respository.dart';
import 'enums.dart';

class InitValue {
  // static late final List<LocationChipData> locationChipList;
  // static late final Map<String, String> surgeryImgMaps;
  // static late final List<HomeBannerData> homeBannerData;
  // static late final List<String> bannerSliders;
  // static late final List<String> menuMainCategories;
  // static late final List<SectionSubData> menuSubCosmetics;
  // static late final List<SectionSubData> menuSubSurgery;

// Private constructor to prevent external instantiation
  InitValue._internal() {
    _bannerListInit();
    _locationChipListInit();
    _surgeryImgMapsInit();

  }

  // The single instance of DumpServer
  static final InitValue _instance = InitValue._internal();

  // Factory constructor to return the same instance
  factory InitValue() {
    return _instance;
  }

  void _locationChipListInit() {
    DataRepository.locationChipList = LocationNames.values.map((locationName) {
      return LocationChipData(
        region: locationName,
        isSelected: locationName == LocationNames.ApguJeong,
      );
    }).toList();
  }

  void _surgeryImgMapsInit() {
    DataRepository.surgeryImgMaps = {
      "surgery_acne": "path/to/surgery_acne.png",
      "surgery_body": "path/to/surgery_body.png",
      "surgery_botox": "path/to/surgery_botox.png",
      "surgery_lifting": "path/to/surgery_lifting.png",
      "surgery_pigmentation": "path/to/surgery_pigmentation.png",
      "surgery_pore": "path/to/surgery_pore.png",
      "surgery_skinbooster": "path/to/surgery_skinbooster.png",
    };
  }

  // Surgery Resource List Enum
  void _bannerListInit() {
    List<String> bannerSlideImage = _bannerSliderInit();
    SurgeryResList.values.asMap().forEach((index, surgeryRes) {
      DataRepository.homeBannerDatas.add(HomeBannerData(
        id: index,
        urlImg: bannerSlideImage[index],
        name: surgeryRes.name,
        desc: "",
      ));
    });
  }

  static const String imageRoot = 'assets/images';
  static const String imageSurgery = '$imageRoot/surgery';

  // Banner Sliders
  List<String> _bannerSliderInit() {
    return [
      '$imageSurgery/surgery_acne.png',
      '$imageSurgery/surgery_body.png',
      '$imageSurgery/surgery_botox.png',
      '$imageSurgery/surgery_lifting.png',
      '$imageSurgery/surgery_pigmentation.png',
      '$imageSurgery/surgery_pore.png',
      '$imageSurgery/surgery_skinbooster.png',
    ];
  }

  // Locations Data
  static List<String> getHospitalList(LocationNames location) {
    switch (location) {
      case LocationNames.ApguJeong:
        return [
          "리원피부과의원",
          "청담에이스의원",
          "워나성형외과의원",
          "레아주서울피부과",
          "웰스피부과 압구정본점",
          "오늘안피부과의원",
          "드림피부과의원",
          "더힐피부과의원",
          "베리굿피부과의원",
          "더3.0피부과의원",
          "압구정 리더스피부과의원"
        ];
      case LocationNames.MyungDong:
        return [
          "아비쥬의원",
          "제이디의원",
          "리엔장의원",
          "씨앤피차앤박피부과의원",
          "아미스킨의원",
          "세가지소원의원명동점",
          "더프리티영의원",
          "톡스앤필의원명동점"
        ];
      case LocationNames.GangNam:
        return [
          "디알피부과의원",
          "세알피부과",
          "셀린피부과의원",
          "강남더의원",
          "오가나셀 피부과의원",
          "청담연세피부과",
          "강남청담미의원",
          "서울에이치피부과의원",
          "예젤의원"
        ];
      case LocationNames.ChungDam:
        return [
          "청담피부과의원",
          "CU클린업피부과의원 청담점",
          "청담아티젠클리닉",
          "청담힐의원",
          "청담연세피부과",
          "스킨다피부과의원청담점",
          "디오디피부과의원 청담",
          "오가나셀 피부과의원",
        ];
      case LocationNames.SongDo:
        return [
          "신사에그의원",
          "청담은피부과의원",
          "신사인피부과의원",
          "피에이치디피부과의원",
          "송도연세피부과의원",
          "휴먼피부과의원",
          "리더스피부과 송도점"
        ];
      case LocationNames.HongDae:
        return [
          "홍대예쁨주의쁨의원",
          "홍대 고운세상피부과",
          "유앤미의원 홍대점",
          "닥터쁘띠의원 홍대점",
          "닥터디자이너의원 홍대",
          "마인드피부과의원",
          "에스준의원 홍대"
        ];
    }
  }
}

class MainMenuName {
  static const String SURGICAL_PROCEDURE = "Surgical procedure";
  static const String COSMETIC_PROCEDURE = "Cosmetic procedure";
  static const String LOCATION = "Location";
  static const String FAVORITE = "Favorite";
  static const String EVENT = "Event";
  static const String ABOUT_US = "About Us";
}
