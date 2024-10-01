

class Constants {
  static double screenWidth = 0;
  static const int GRID_NUM = 2;
  static const double GRID_RATIO = 1;
  static const int GRID_MAX_COUNT = 4;
  static const delayTime = 2;
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

class HomeFixedDimens {

  final _totalHorizontalPadding = Dimens.home_grid_horizontal_padding * 2;
  final _totalCrossAxisSpacing = 10.0 * (Constants.GRID_NUM - 1);
  final _numberOfRows = 2;

  double getGridHeight() {
    final _availableWidth =
        Constants.screenWidth - _totalHorizontalPadding - _totalCrossAxisSpacing;
    final _itemWidth = _availableWidth / Constants.GRID_NUM;
    final _itemHeight = _itemWidth / Constants.GRID_RATIO;
    final _gridHeight = (_itemHeight * _numberOfRows) + (10.0 * (_numberOfRows - 1)) + 50;
    return _gridHeight;
  }

}
