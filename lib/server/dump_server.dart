import 'dart:convert';

import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/model/review_data.dart';
import 'package:location_shop/model/surgery_data.dart';
import 'package:location_shop/model/hospital_detail_info_desc.dart';
import 'package:location_shop/server/jsondata/hospital_detail_json.dart';
import 'package:location_shop/server/jsondata/review_data_json.dart';
import 'package:location_shop/server/jsondata/surgery_data_json.dart';

import '../common/init_value.dart';
import '../model/event_data.dart';
import '../model/hospital_data.dart';
import 'jsondata/event_data_json.dart';
import 'jsondata/hospital_data_json.dart';
import 'jsondata/hospital_detail_desc_json.dart';

class DumpServer {
  late final List<EventData> _eventDataList;
  late final List<HospitalData> _hospitalDataList;
  late final List<HospitalDetail> _hospitalDetailDataList;
  late final List<HospitalDetailInfoDesc> _hospitalDetailInfoDescDataList;
  late final List<ReviewData> _reviewDataList;
  late final List<SurgeryData> _surgeryDataList;
  final isLocalData = true;

  // Private constructor to prevent external instantiation
  DumpServer._internal() {
    InitValue();
    _buildEventData();
    _buildHospitalData();
    _buildHospitalDetailData();
    _buildHospitalDetailInfoDescData();
    _buildReviewData();
    _buildSurgeryData();
  }

  // The single instance of DumpServer
  static final DumpServer _instance = DumpServer._internal();

  // Factory constructor to return the same instance
  factory DumpServer() {
    return _instance;
  }

  Future<List<EventData>> getEventDataAllList() async {
    if (_eventDataList.isEmpty) {
      _buildEventData();
    }
    return _eventDataList;
  }

  Future<HospitalData> getHospitalDataById(int id) async {
    if (_hospitalDataList.isEmpty) {
      _buildHospitalData();
    }
    return _hospitalDataList.firstWhere((data) => data.id == id, orElse: null);
  }

  Future<List<HospitalData>> getHospitalDataAllList() async {
    if (_hospitalDataList.isEmpty) {
      _buildHospitalData();
    }
    return _hospitalDataList;
  }

  Future<List<HospitalDetail?>> getHospitalDetailDataAllList() async {
    if (_hospitalDetailDataList.isEmpty) {
      _buildHospitalDetailData();
    }
    return _hospitalDetailDataList;
  }

  Future<HospitalDetail?> getHospitalDetailDataById(int id) async {
    if (_hospitalDetailDataList.isEmpty) {
      _buildHospitalDetailData();
    }
    return _hospitalDetailDataList.firstWhere((data) => data.id == id,
        orElse: null);
  }

  Future<List<HospitalDetailInfoDesc>> getHospitalInfoDescData() async {
    if (_hospitalDetailInfoDescDataList.isEmpty) {
      _buildHospitalDetailInfoDescData();
    }
    return _hospitalDetailInfoDescDataList;
  }

  Future<HospitalDetailInfoDesc?> getDetailHospitalInfoDescDataById(
      int id) async {
    if (_hospitalDetailInfoDescDataList.isEmpty) {
      _buildHospitalDetailInfoDescData();
    }
    return _hospitalDetailInfoDescDataList.firstWhere((data) => data.id == id,
        orElse: null);
  }

  Future<List<HospitalData>> getHospitalListByLocation(String currentRegion) async {
    var list = await getHospitalDataAllList();
    return list.where((data) => data.region.toLowerCase() == (currentRegion.toLowerCase())).toList();
  }

  Future<List<ReviewData>> getReviewDataAllList() async {
    if (_reviewDataList.isEmpty) {
      _buildReviewData();
    }
    return _reviewDataList;
  }

  List<SurgeryData> getSurgeryData() {
    if (_surgeryDataList.isEmpty) {
      _buildSurgeryData();
    }
    return _surgeryDataList;
  }

  String convertLocalData(String jsonStr) {
    String convertStr = jsonStr.replaceAll(
        "https://tqyarvckzieoraneohvv.supabase.co/storage/v1/object/public/hospitalstatic/staticdata/",
        "assets/");
    return convertStr;
  }

  void updateLocalImagePathReview() {
    List<ReviewData> updatedReviewDataList = _reviewDataList.map((review) {
      return ReviewData(
        id: review.id,
        hospitalId: review.hospitalId,
        surgeryId: review.surgeryId,
        reviewImg: "assets/images/reviews/${review.reviewImg}",
        userId: review.userId,
        reviewDesc: review.reviewDesc,
      );
    }).toList();
    _reviewDataList = updatedReviewDataList;
  }

  ///
  /// prepare server dump data
  ///
  void _buildEventData() {
    if (isLocalData) {
      Map<String, dynamic> jsonData =
      jsonDecode(convertLocalData(eventDataJson));
      _eventDataList = EventsResponse.fromJson(jsonData).datas;
    } else {
      Map<String, dynamic> jsonData = jsonDecode(eventDataJson);
      _eventDataList = EventsResponse.fromJson(jsonData).datas;
    }
  }


  void _buildHospitalData() {
    if (isLocalData) {
      Map<String, dynamic> jsonData =
      jsonDecode(convertLocalData(hospitalDataJson));
      _hospitalDataList = HospitalDataResponse.fromJson(jsonData).datas;
    } else {
      Map<String, dynamic> jsonData = jsonDecode(hospitalDataJson);
      _hospitalDataList = HospitalDataResponse.fromJson(jsonData).datas;
    }
  }

  void _buildHospitalDetailData() {
    if (isLocalData) {
      Map<String, dynamic> jsonData =
      jsonDecode(convertLocalData(hospitalDetailJson));
      _hospitalDetailDataList = HospitalDetailResponse.fromJson(jsonData).datas;
    } else {
      Map<String, dynamic> jsonData = jsonDecode(hospitalDetailJson);
      _hospitalDetailDataList = HospitalDetailResponse.fromJson(jsonData).datas;
    }
  }

  void _buildHospitalDetailInfoDescData() {
    if (isLocalData) {
      Map<String, dynamic> jsonData =
      jsonDecode(convertLocalData(detailHospitalInfoDescJson));
      _hospitalDetailInfoDescDataList =
          DetailHospitalInfoDescResponse.fromJson(jsonData).datas;
    } else {
      Map<String, dynamic> jsonData = jsonDecode(detailHospitalInfoDescJson);
      _hospitalDetailInfoDescDataList =
          DetailHospitalInfoDescResponse.fromJson(jsonData).datas;
    }
  }

  void _buildReviewData() {
    if (isLocalData) {
      RegExp regExp = RegExp(r'review_.*?\.(png|jpg|jpeg)');
      // 모든 매치를 찾아서 변환
      String modifyImgaePathDataJson =
      reviewDataJson.replaceAllMapped(regExp, (match) {
        return 'assets/images/reviews/${match.group(0)}';
      });
      Map<String, dynamic> jsonData =
      jsonDecode(convertLocalData(modifyImgaePathDataJson));

      _reviewDataList = ReviewDataResponse.fromJson(jsonData).datas;
      // updateLocalImagePathReview();
    } else {
      Map<String, dynamic> jsonData = jsonDecode(reviewDataJson);
      _reviewDataList = ReviewDataResponse.fromJson(jsonData).datas;
    }
  }

  void _buildSurgeryData() {
    if (isLocalData) {
      Map<String, dynamic> jsonData =
      jsonDecode(convertLocalData(surgeryDataJson));
      _surgeryDataList = SurgeryDataResponse.fromJson(jsonData).datas;
    } else {
      Map<String, dynamic> jsonData = jsonDecode(surgeryDataJson);
      _surgeryDataList = SurgeryDataResponse.fromJson(jsonData).datas;
    }
  }
}
