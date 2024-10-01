import 'package:location_shop/datasource/datasource_location.dart';

import '../common/constants.dart';
import '../datasource/datasource_newbeatuy.dart';
import '../server/dump_server.dart';
import '../model/hospital_data.dart';

class RepositoryNewBeauty {
  final DataSourceNewBeauty _dataSourceNewBeauty = DataSourceNewBeauty();

  Future<List<HospitalData>> getNewBeautyDatas() async {
    return await _dataSourceNewBeauty.getNewBeautyDatas();
  }
}