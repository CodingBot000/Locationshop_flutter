import 'package:flutter/cupertino.dart';

class Constants {
  static double screenWidth = 0;
  static const int GRID_NUM = 2;
  static const double GRID_RATIO = 1;
}

class Dimens {
  static const double home_grid_horizontal_padding = 10;
  static const double footer_height = 100;
  static final gridImageSize = Constants.screenWidth / 2 - Dimens.home_grid_horizontal_padding * 2;
  static const double listImageSize = 130;
  static const double listPadding = 10;
  static const double listHeight = listImageSize + listPadding;
}


Map<int, String> SurgeryIdMapper = {
  1000: "Eyes",
  1001: "Nose",
  1002: "bimaxillary operation",
  1003: "liposuction",
  1004: "Hair transplantation",
  2000: "Ulthera",
  2001: "Thermage",
  2002: "InMode",
  2003: "Shrink",
  2004: "Botox",
  2005: "Filler",
  2006: "Skinbooster",
  2007: "Tune face",
};
// Map<String, int> SurgeryIdMapper = {
//   "Eyes": 1000,
//   "Nose": 1001,
//   "bimaxillary operation": 1002,
//   "liposuction": 1003,
//   "Hair transplantation": 1004,
//   "Ulthera": 2000,
//   "Thermage": 2001,
//   "InMode": 2002,
//   "Shrink": 2003,
//   "Botox": 2004,
//   "Filler": 2005,
//   "Skinbooster": 2006,
//   "Tune face": 2007,
// };
//
