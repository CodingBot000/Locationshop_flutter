import 'package:flutter/cupertino.dart';
import 'package:location_shop/common/enums.dart';
import 'package:location_shop/model/hospital_data.dart';
import 'package:location_shop/repository/repository_newbeauty.dart';
import 'package:location_shop/repository/respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/chip_location_data.dart';
import '../repository/repository_location.dart';

class HomePageState {
  final AsyncValue<List<HospitalData>> hospitalDatasNewBeauty;
  final AsyncValue<List<HospitalData>> hospitalDatasByLocation;
  final AsyncValue<LocationChipData> selectLocationButton;

  HomePageState({
    required this.hospitalDatasNewBeauty,
    required this.hospitalDatasByLocation,
    required this.selectLocationButton,
  });

  factory HomePageState.initial() {
    return HomePageState(
      hospitalDatasNewBeauty: const AsyncValue.loading(),
      hospitalDatasByLocation: const AsyncValue.loading(),
      selectLocationButton: AsyncValue.data(
          LocationChipData(region: LocationNames.ApguJeong, isSelected: true)),
    );
  }

  HomePageState copyWith({
    AsyncValue<List<HospitalData>>? hospitalDatasNewBeauty,
    AsyncValue<List<HospitalData>>? hospitalDatasByLocation,
    AsyncValue<LocationChipData>? selectLocationButton,
  }) {
    return HomePageState(
      hospitalDatasNewBeauty:
          hospitalDatasNewBeauty ?? this.hospitalDatasNewBeauty,
      hospitalDatasByLocation:
          hospitalDatasByLocation ?? this.hospitalDatasByLocation,
      selectLocationButton: selectLocationButton ?? this.selectLocationButton,
    );
  }
}

final hospitalViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomePageState>((ref) {
  return HomeViewModel(
      RepositoryByLocation(),
      RepositoryNewBeauty(),
  );
});

class HomeViewModel extends StateNotifier<HomePageState> {
  final RepositoryByLocation _repositoryByLocation;
  final RepositoryNewBeauty _repositoryNewBeauty;

  HomeViewModel(
      this._repositoryByLocation,
      this._repositoryNewBeauty,
      ) : super(HomePageState.initial()) {
    fetchNewBeautyData();
    fetchHospitalDataByLocation(LocationNames.ApguJeong.value);
  }

  void selectLocationChipData(LocationChipData chipData) {
    state = state.copyWith(selectLocationButton: AsyncValue.data(chipData));
    fetchHospitalDataByLocation(chipData.region.value);
  }

  Future<void> fetchNewBeautyData() async {
    try {
      state =
          state.copyWith(hospitalDatasNewBeauty: const AsyncValue.loading());
      final data = await _repositoryNewBeauty.getNewBeautyDatas();
      state = state.copyWith(hospitalDatasNewBeauty: AsyncValue.data(data));
    } catch (e, stack) {
      state =
          state.copyWith(hospitalDatasNewBeauty: AsyncValue.error(e, stack));
    }
  }

  Future<void> fetchHospitalDataByLocation(String locationName) async {
    try {
      state =
          state.copyWith(hospitalDatasByLocation: const AsyncValue.loading());
      final data =
          await _repositoryByLocation.getHospitalListByLocation(locationName);
      state = state.copyWith(hospitalDatasByLocation: AsyncValue.data(data));
    } catch (e, stack) {
      state =
          state.copyWith(hospitalDatasByLocation: AsyncValue.error(e, stack));
    }
  }
}
