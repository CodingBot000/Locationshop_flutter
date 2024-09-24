import 'dart:math';

import 'package:location_shop/common/enums.dart';
import 'package:location_shop/data/hospital_data.dart';
import 'package:location_shop/server/dump_server.dart';

import '../data/MenuSection.dart';
import '../data/chip_location_data.dart';
import '../data/home_banner_data.dart';

class DataRepository {
  /**
   * Home's banner Slider
   */
  static List<HomeBannerData> homeBannerDatas = [];

  /**
   * home's' New Beauty List
   */
  static List<HospitalData> newBeautyList = [];

  /**
   * home's Location Chips List
   */
  static List<LocationChipData> locationChipList = [];

  /**
   * home's Location Hospital List
   */
  // static List<HospitalData> homeLocationHospitals = [];

  static Map<String, String> surgeryImgMaps = {};

  // static List<String> bannerSliders = [];
  static List<String> menuMainCategories = [];
  static List<SectionSubData> menuSubCosmetics = [];
  static List<SectionSubData> menuSubSurgery = [];

  DataRepository._internal() {
    DumpServer();

    _buildNewBeautyDatas();
  }

  // The single instance of DumpServer
  static final DataRepository _instance = DataRepository._internal();

  // Factory constructor to return the same instance
  factory DataRepository() {
    return _instance;
  }

  void _buildNewBeautyDatas() {
    List<HospitalData> hospitalDatas = DumpServer().getHospitalData();
    Random random = Random();
    Set<int> randomIndices = {};
    while (randomIndices.length < 6) {
      randomIndices.add(
          random.nextInt(hospitalDatas.length)); // 0부터 리스트 크기 - 1까지 랜덤한 인덱스 생성
    }
    newBeautyList = randomIndices.map((index) => hospitalDatas[index]).toList();
  }

  static List<HospitalData> getHospitalListByLocation(String currentRegion) {
    List<HospitalData> hospitalDatas = DumpServer().getHospitalData();
    List<HospitalData> homeLocationHospitals = [];
    // homeLocationHospitals.clear();
    for (var hospitalData in hospitalDatas) {
      if (hospitalData.region == currentRegion) {
        homeLocationHospitals.add(hospitalData);
      }
    }
    return homeLocationHospitals;
  }

// static const String imageRoot = 'assets/images';
// static const String imageSurgery = '$imageRoot/surgery';
// static const List bannerLists  = [
//   '$imageSurgery/surgery_acne.png',
//   '$imageSurgery/surgery_body.png',
//   '$imageSurgery/surgery_botox.png',
//   '$imageSurgery/surgery_pore.png',
//   '$imageSurgery/surgery_lifting.png',
//   '$imageSurgery/surgery_skinbooster.png',
// ];

// static const String imageHospitalImg = '$imageRoot/hospitalimg';
// static const List newBeautyList  = [
//   '$imageHospitalImg/hospital_reone.png',
//   '$imageHospitalImg/hospital2_youjins.png',
//   '$imageHospitalImg/hospital_wanna_plastic_surgery.png',
//   '$imageHospitalImg/hospital5_vline.png',
//   '$imageHospitalImg/hospital4_boss.png',
//   '$imageHospitalImg/hospital3_brillyn.png',
// ];

// static const String imageHospitalImg = '$imageRoot/hospitalimg';
// static const List newBeautyList  = [
// '$imageHospitalImg/hospital_reone.png',
// '$imageHospitalImg/hospital2_youjins.png',
// '$imageHospitalImg/hospital_wanna_plastic_surgery.png',
// '$imageHospitalImg/hospital_vline.png',
// '$imageHospitalImg/hospital_boss.png',
// '$imageHospitalImg/hospital3_brillyn.png',
// ];
}
