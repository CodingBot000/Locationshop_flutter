import 'package:location_shop/datasource/datasource_event.dart';

import '../model/event_data.dart';


class RepositoryEvent {
  final DataSourceEvent _datasource = DataSourceEvent();

  Future<List<EventData>> getEventAllDatas() async {
    return _datasource.getEventData();
  }
  Future<List<EventData>> getEventDataListById(int id) async {
    var list = await _datasource.getEventData();
    return list.where((data) => data.hospitalId == id).toList();
  }
}