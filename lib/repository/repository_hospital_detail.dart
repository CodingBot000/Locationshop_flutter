import 'package:location_shop/datasource/datasource_hospital_info.dart';
import 'package:location_shop/datasource/datasource_location.dart';
import 'package:location_shop/model/hospital_data.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/model/hospital_detail_info_desc.dart';

import '../common/constants.dart';

class RepositoryHospitalDetail {
  final DataSourceHospitalInfo _dataSourceHospitalInfo = DataSourceHospitalInfo();

  Future<HospitalData?> getHospitalDataById(int id) async {
    return await _dataSourceHospitalInfo.getHospitalInfoById(id);
  }

  Future<HospitalDetail?> getHospitalDetailInfoById(int id) async {
    return await _dataSourceHospitalInfo.getHospitalDetailInfoById(id);
  }

  Future<HospitalDetailInfoDesc?> getDetailHospitalInfoDescData(int id) async {
    return await _dataSourceHospitalInfo.getDetailHospitalInfoDescData(id);
  }

}