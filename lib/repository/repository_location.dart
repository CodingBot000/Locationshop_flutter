import 'package:location_shop/datasource/datasource_location.dart';

import '../common/constants.dart';
import '../datasource/dump_server.dart';
import '../model/hospital_data.dart';

class RepositoryByLocation {
  final DataSourceLocation _dataSourceLocation = DataSourceLocation();
  Future<List<HospitalData>> getHospitalListByLocation(String currentRegion) async {
    return await _dataSourceLocation.getHospitalListByLocation(currentRegion);
  }
}