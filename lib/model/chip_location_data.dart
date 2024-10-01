
import 'package:flutter/cupertino.dart';

import '../common/enums.dart';

@immutable
class LocationChipData {
  const LocationChipData({required this.region, this.isSelected = false});

  final LocationNames region;
  final bool isSelected;

  LocationChipData copyWith({LocationNames? region, bool? isSelected}) {
    return LocationChipData(
      region: region ?? this.region,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

