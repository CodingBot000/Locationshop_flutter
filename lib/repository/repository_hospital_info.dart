import 'package:location_shop/datasource/datasource_location.dart';

import '../common/constants.dart';
import '../datasource/datasource_newbeatuy.dart';
import '../datasource/dump_server.dart';
import '../model/hospital_data.dart';

class RepositoryNewBeauty {
  final DataSourceNewBeauty _dataSourceNewBeauty = DataSourceNewBeauty();
  Future<List<HospitalData>> getNewBeautyDatas() async {
    await Future.delayed(const Duration(seconds: Constants.delayTime));
    return await _dataSourceNewBeauty.getNewBeautyDatas();
  }
}

