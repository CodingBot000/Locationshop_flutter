

import 'package:location_shop/data/chip_location_data.dart';

class MenuScreenArguments {
  final String menuTitle;
  MenuScreenArguments(this.menuTitle);
}

class MenuScreenLocationArguments {
  final String menuTitle;
  final LocationChipData chipData;
  MenuScreenLocationArguments(this.menuTitle, this.chipData);
}