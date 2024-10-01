import 'dart:convert';
import 'dart:math';

import 'package:location_shop/common/constants.dart';
import 'package:location_shop/datasource/dump_server.dart';
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
import '../server/jsondata/event_data_json.dart';
import '../server/jsondata/hospital_data_json.dart';
import '../server/jsondata/hospital_detail_desc_json.dart';

class DataSourceReview {

  Future<List<ReviewData>> getReviewAllDataList() async {
    await Future.delayed(const Duration(seconds: Constants.delayTime));
    return await DumpServer().getReviewDataAllList();
  }

  Future<List<ReviewData>> getReviewDataListById(int id) async {
    await Future.delayed(const Duration(seconds: Constants.delayTime));
    var list = await DumpServer().getReviewDataAllList();
    return list.where((data) => data.hospitalId == id).toList();
  }
}