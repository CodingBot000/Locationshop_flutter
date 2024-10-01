import 'package:location_shop/model/event_data.dart';

class MenuScreenArguments {
  final String menuTitle;
  MenuScreenArguments(this.menuTitle);
}

class HosptialDetailArguments {
  final int id;
  HosptialDetailArguments(this.id);
}

class EventArguments {
  final EventData data;
  EventArguments(this.data);
}