

import 'package:location_shop/model/chip_location_data.dart';
import 'package:location_shop/model/event_data.dart';

class MenuScreenArguments {
  final String menuTitle;
  MenuScreenArguments(this.menuTitle);
}

class MenuScreenLocationArguments {
  final LocationChipData chipData;
  MenuScreenLocationArguments(this.chipData);
}


class HosptialDetailArguments {
  final int id;
  HosptialDetailArguments(this.id);
}

class EventArguments {
  final EventData data;
  EventArguments(this.data);
}