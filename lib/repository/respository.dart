import 'dart:math';

import 'package:location_shop/model/hospital_data.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/model/hospital_detail_info_desc.dart';
import 'package:location_shop/model/review_data.dart';
import 'package:location_shop/datasource/dump_server.dart';

import '../common/constants.dart';
import '../model/menu_section.dart';
import '../model/chip_location_data.dart';
import '../model/event_data.dart';
import '../model/home_banner_data.dart';
import '../model/surgery_data.dart';

class DataRepository {
  /// Home's banner Slider
  static List<HomeBannerData> homeBannerDatas = [];

  /// home's Location Chips List
  static List<LocationChipData> locationChipList = [];

  static Map<String, String> surgeryImgMaps = {};

  DataRepository._internal() {
    DumpServer();

  }

  // The single instance of DumpServer
  static final DataRepository _instance = DataRepository._internal();


  // Factory constructor to return the same instance
  factory DataRepository() {
    return _instance;
  }
  static DataRepository get instance => _instance;

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

  // Future<List<ReviewData>> getReviewAllDatas() async {
  //   await Future.delayed(Duration(seconds: Constants.delayTime));
  //   return DumpServer().getReviewData();
  // }
  //
  // Future<List<ReviewData>> getReviewDataListById(int id) async {
  //   await Future.delayed(Duration(seconds: Constants.delayTime));
  //   var list =  DumpServer().getReviewData();
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
