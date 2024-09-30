import 'package:location_shop/common/constants.dart';
import 'package:location_shop/datasource/datasource_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../datasource/dump_server.dart';
import '../model/event_data.dart';


class RepositoryEvent {
  final DataSourceEvent _datasource = DataSourceEvent();

  Future<List<EventData>> getEventAllDatas() async {
    await Future.delayed(const Duration(seconds: Constants.delayTime));
    return _datasource.getEventData();
  }
  Future<List<EventData>> getEventDataListById(int id) async {
    await Future.delayed(const Duration(seconds: Constants.delayTime));
    var list = await _datasource.getEventData();
    return list.where((data) => data.hospitalId == id).toList();
  }
}