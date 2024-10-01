import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_shop/repository/respository.dart';

import '../common/enums.dart';
import '../model/chip_location_data.dart';
import '../model/hospital_data.dart';
import '../repository/repository_location.dart';

class LocationScreenPageState {
  final AsyncValue<List<HospitalData>> hospitalDatasByLocation;
  final AsyncValue<LocationChipData> selectLocationButton;

  LocationScreenPageState({
    required this.hospitalDatasByLocation,
    required this.selectLocationButton,
  });

  factory LocationScreenPageState.initial() {
    return LocationScreenPageState(
      hospitalDatasByLocation: const AsyncValue.loading(),
      selectLocationButton: AsyncValue.data(
          LocationChipData(region: LocationNames.ApguJeong, isSelected: true)),
    );
  }

  LocationScreenPageState copyWith({
    AsyncValue<List<HospitalData>>? hospitalDatasByLocation,
    required AsyncValue<LocationChipData> selectLocationButton,
  }) {
    return LocationScreenPageState(
      hospitalDatasByLocation:
          hospitalDatasByLocation ?? this.hospitalDatasByLocation,
      selectLocationButton: selectLocationButton,
    );
  }
}

final locationViewModelProvider =
    StateNotifierProvider<LocationViewModel, LocationScreenPageState>((ref) {
  return LocationViewModel(RepositoryByLocation());
});

class LocationViewModel extends StateNotifier<LocationScreenPageState> {
  final RepositoryByLocation _repository;

  LocationViewModel(this._repository)
      : super(LocationScreenPageState.initial()) {}

  void selectLocationChipData(LocationChipData chipData) {
    state = state.copyWith(selectLocationButton: AsyncValue.data(chipData));
    fetchHospitalDataByLocation(chipData.region.value);
  }

  Future<void> fetchHospitalDataByLocation(String locationName) async {
    try {
      state = state.copyWith(
          hospitalDatasByLocation: const AsyncValue.loading(),
          selectLocationButton: state.selectLocationButton);
      final data =
          await _repository.getHospitalListByLocation(locationName);
      state = state.copyWith(
          hospitalDatasByLocation: AsyncValue.data(data),
          selectLocationButton: state.selectLocationButton);
    } catch (e, stack) {
      state = state.copyWith(
          hospitalDatasByLocation: AsyncValue.error(e, stack),
          selectLocationButton: state.selectLocationButton);
    }
  }
}
