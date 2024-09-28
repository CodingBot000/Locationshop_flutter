

class Constants {
  static double screenWidth = 0;
  static const int GRID_NUM = 2;
  static const double GRID_RATIO = 1;
}

class Dimens {
  static const double home_grid_horizontal_padding = 10;
  static const double footer_height = 100;
  static final gridImageSize =
      Constants.screenWidth / 2 - Dimens.home_grid_horizontal_padding * 2;
  static const double listImageSize = 130;
  static const double listPadding = 10;
  static const double listHeight = listImageSize + listPadding;
}
