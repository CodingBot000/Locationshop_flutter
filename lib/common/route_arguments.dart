

import 'package:location_shop/data/chip_location_data.dart';

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