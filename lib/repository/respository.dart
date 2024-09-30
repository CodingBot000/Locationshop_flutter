import 'dart:math';

import 'package:location_shop/model/hospital_data.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/model/hospital_detail_info_desc.dart';
import 'package:location_shop/model/review_data.dart';
import 'package:location_shop/datasource/data_source.dart';

import '../model/menu_section.dart';
import '../model/chip_location_data.dart';
import '../model/event_data.dart';
import '../model/home_banner_data.dart';
import '../model/surgery_data.dart';

class DataRepository {
  /// Home's banner Slider
  static List<HomeBannerData> homeBannerDatas = [];

  /// home's' New Beauty List
  static List<HospitalData> newBeautyList = [];

  /// home's Location Chips List
  static List<LocationChipData> locationChipList = [];

  /// home's Location Hospital List
  // static List<HospitalData> homeLocationHospitals = [];
  // /**
  //  * Event Datas
  //  */
  // static List<String> eventDatas = [];
  //
  static Map<String, String> surgeryImgMaps = {};

  // static List<String> bannerSliders = [];
  static List<String> menuMainCategories = [];
  static List<SectionSubData> menuSubCosmetics = [];
  static List<SectionSubData> menuSubSurgery = [];

  DataRepository._internal() {
    DumpServer();

    // _buildNewBeautyDatas();
  }

  // The single instance of DumpServer
  static final DataRepository _instance = DataRepository._internal();


  // Factory constructor to return the same instance
  factory DataRepository() {
    return _instance;
  }
  static DataRepository get instance => _instance;

  static const delayTime = 2;
  Future<List<HospitalData>> getNewBeautyDatas() async {
    await Future.delayed(Duration(seconds: delayTime));
    List<HospitalData> hospitalDatas = DumpServer().getHospitalData();
    Random random = Random();
    Set<int> randomIndices = {};
    while (randomIndices.length < 6) {
      randomIndices.add(
          random.nextInt(hospitalDatas.length));
    }
    return randomIndices.map((index) => hospitalDatas[index]).toList();
    // newBeautyList = randomIndices.map((index) => hospitalDatas[index]).toList();
  }

  // void _buildNewBeautyDatas() {
  //
  //   List<HospitalData> hospitalDatas = DumpServer().getHospitalData();
  //   Random random = Random();
  //   Set<int> randomIndices = {};
  //   while (randomIndices.length < 6) {
  //     randomIndices.add(
  //         random.nextInt(hospitalDatas.length)); // 0부터 리스트 크기 - 1까지 랜덤한 인덱스 생성
  //   }
  //   newBeautyList = randomIndices.map((index) => hospitalDatas[index]).toList();
  // }

  HospitalData? getHospitalInfoById(int id) {
    try {
      return DumpServer().getHospitalData().firstWhere((data) => data.id == id);
    } catch (e) {
      return null;
    }
  }

  HospitalDetail? getHospitalDetailInfoById(int id) {
    try {
      return DumpServer().getHospitalDetailData().firstWhere((data) => data.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<HospitalData>> getHospitalListByLocationAsync(String currentRegion) async {
    await Future.delayed(Duration(seconds: delayTime));
    var list = DumpServer().getHospitalData()
        .where((data) => data.region.toLowerCase() == (currentRegion.toLowerCase())).toList();
    return list;
  }

  List<HospitalData> getHospitalListByLocation(String currentRegion) {
    // var hopsitalDatas = DumpServer().getHospitalData();
    // testGroupBy(hopsitalDatas);
      var list = DumpServer().getHospitalData()
          .where((data) => data.region.toLowerCase() == (currentRegion.toLowerCase())).toList();
      return list;
    }
  testGroupBy(List<HospitalData> hospitalList) {
      Map<String, int> regionCounts = {};

      for (var hospital in hospitalList) {
        String region = hospital.region;
        regionCounts.update(region, (count) => count + 1, ifAbsent: () => 1);
      }

      // regionCounts.forEach((region, count) {
      //   print('Region: $region, Count: $count');
      // });
  }
  SurgeryData getSurgeryDataByName(String surgeryName) {
    var list = DumpServer().getSurgeryData();
    for (var data in list) {
      if (surgeryName.toLowerCase().replaceAll(" ", "").contains(
          data.surgeryName.toLowerCase().replaceAll(" ", ""))
      ) {
        if (data.surgeryImgs.isNotEmpty) {
          if (!data.surgeryImgs[0].contains('assets/images/surger')) {
            data.surgeryImgs[0] =
            "assets/images/surgery/${data.surgeryImgs[0]}";
          }
        }
        return data;
      }
    }
    return SurgeryData(id: 999, surgeryName: surgeryName, surgeryImgs: [], surgeryDesc: "Developing...");
  }

  Future<List<EventData>> getEventAllDatas() async {
    await Future.delayed(Duration(seconds: delayTime));
    return DumpServer().getEventData();
  }
  Future<List<EventData>> getEventDataListById(int id) async {
  // List<EventData> getEventDataListById(int id) {
    var list =  DumpServer().getEventData();
    return list.where((data) => data.hospitalId == id).toList();
  }
  // List<EventData> getEventAllDatas() {
  //   return DumpServer().getEventData();
  // }

  // List<EventData> getEventDataListById(int id) {
  //   var list =  DumpServer().getEventData();
  //   return list.where((data) => data.hospitalId == id).toList();
  // }

  List<ReviewData> getReviewAllDatas() {
    return DumpServer().getReviewData();
  }

  List<ReviewData> getReviewDataListById(int id) {
    var list =  DumpServer().getReviewData();
    return list.where((data) => data.hospitalId == id).toList();
  }

  DetailHospitalInfoDesc? getDetailHospitalInfoDescData(int id) {
    var list =  DumpServer().getDetailHospitalInfoDescData();
    // var data = list.firstWhere((data) => data.id == id);
    DetailHospitalInfoDesc? data = list.firstWhere((data) => data.id == id);
    return data;
    // return DumpServer().getDetailHospitalInfoDescData()
    //     .firstWhere((data) => data.id == id);
  }
}
