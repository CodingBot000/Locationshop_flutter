import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/chip_location_data.dart';
import 'enums.dart';

final locationChipProvider =
StateNotifierProvider<LocationChipNotifier, List<LocationChipData>>(
        (ref) => LocationChipNotifier());


class LocationChipNotifier extends StateNotifier<List<LocationChipData>> {
  LocationChipNotifier() : super(_initialLocations());

  static List<LocationChipData> _initialLocations() {
    return LocationNames.values.map((location) {
      return LocationChipData(
        region: location,
        isSelected: location == LocationNames.ApguJeong,
      );
    }).toList();
  }

  void toggleSelection(Object regionInput) {
    LocationNames? region;

    if (regionInput is LocationNames) {
      region = regionInput;
    } else if (regionInput is String) {
      region = _stringToLocationNames(regionInput);
      if (region == null) {
        print('Warning: "$regionInput" is not a valid LocationNames value.');
        return;
      }
    } else {
      print('Error: toggleSelection received an unsupported type.');
      return;
    }

    deselectAll();
    state = state.map((locationData) {
      if (locationData.region == region) {
        return locationData.copyWith(isSelected: !locationData.isSelected);
      }
      return locationData;
    }).toList();
    }

  LocationNames? _stringToLocationNames(String regionString) {
    try {
      return LocationNames.values.firstWhere(
            (e) => e.value.toLowerCase() == regionString.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  void selectLocation(LocationNames region) {
    state = state
        .map((locationData) => locationData.region == region
        ? locationData.copyWith(isSelected: true)
        : locationData)
        .toList();
  }

  void deselectAll() {
    state = state
        .map((locationData) => locationData.copyWith(isSelected: false))
        .toList();
  }
}