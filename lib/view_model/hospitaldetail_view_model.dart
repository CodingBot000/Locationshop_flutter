import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_shop/model/hospital_detail_data.dart';
import 'package:location_shop/model/hospital_detail_info_desc.dart';
import 'package:location_shop/repository/repository_hospital_detail.dart';
import 'package:location_shop/repository/respository.dart';

import '../common/enums.dart';
import '../model/chip_location_data.dart';
import '../model/hospital_data.dart';
import '../repository/repository_location.dart';

class HospitalDetailPageState {
  final AsyncValue<HospitalData> hospitalData;
  final AsyncValue<HospitalDetail> hospitalDetail;
  final AsyncValue<HospitalDetailInfoDesc> detailHospitalInfoDesc;

  HospitalDetailPageState({
    required this.hospitalData,
    required this.hospitalDetail,
    required this.detailHospitalInfoDesc,
  });

  factory HospitalDetailPageState.initial() {
    return HospitalDetailPageState(
      hospitalData: const AsyncValue.loading(),
      hospitalDetail: const AsyncValue.loading(),
      detailHospitalInfoDesc: const AsyncValue.loading(),
    );
  }

  HospitalDetailPageState copyWith({
    AsyncValue<HospitalData>? hospitalData,
    AsyncValue<HospitalDetail>? hospitalDetail,
    AsyncValue<HospitalDetailInfoDesc>? detailHospitalInfoDesc,
  }) {
    return HospitalDetailPageState(
      hospitalData: hospitalData ?? this.hospitalData,
      hospitalDetail: hospitalDetail ?? this.hospitalDetail,
      detailHospitalInfoDesc: detailHospitalInfoDesc ?? this.detailHospitalInfoDesc,
    );
  }
}

// // final hospitalDetailViewModelProvider =
// //     StateNotifierProvider<HospitalDetailViewModel, HospitalDetailPageState>((ref, id) {
// //   return HospitalDetailViewModel(RepositoryHospitalDetail(), id);
// // });
// final hospitalDetailViewModelProvider =
// StateNotifierProvider.family<HospitalDetailViewModel, HospitalDetailPageState, int>(
//         (ref, id) {
//   return HospitalDetailViewModel(RepositoryHospitalDetail(), id);
// });
//
// class HospitalDetailViewModel extends StateNotifier<HospitalDetailPageState> {
//   final RepositoryHospitalDetail _repository;
//   final int _id;
//
//   HospitalDetailViewModel(this._repository, this._id)
//       : super(HospitalDetailPageState.initial()) {
//     getHospitalDetailInfoById(_id);
//     getDetailHospitalInfoDescData(_id);
//   }


// final hospitalDetailViewModelProvider =
//     StateNotifierProvider<HospitalDetailViewModel, HospitalDetailPageState>((ref, id) {
//   return HospitalDetailViewModel(RepositoryHospitalDetail(), id);
// });
final hospitalDetailViewModelProvider =
StateNotifierProvider<HospitalDetailViewModel, HospitalDetailPageState>(
        (ref) {
      return HospitalDetailViewModel(RepositoryHospitalDetail());
    });

class HospitalDetailViewModel extends StateNotifier<HospitalDetailPageState> {
  final RepositoryHospitalDetail _repository;

  HospitalDetailViewModel(this._repository)
      : super(HospitalDetailPageState.initial()) {}


  Future<void> getHospitalDataInfoById(int id) async {
    try {
      state = state.copyWith(
          hospitalData: const AsyncValue.loading());
      final data =
      await _repository.getHospitalDataById(id);
      state = state.copyWith(
          hospitalData: AsyncValue.data(data!));
    } catch (e, stack) {
      state = state.copyWith(
          hospitalData: AsyncValue.error(e, stack));
    }
  }


  Future<void> getHospitalDetailInfoById(int id) async {
    try {
      state = state.copyWith(
          hospitalDetail: const AsyncValue.loading());
      final data =
          await _repository.getHospitalDetailInfoById(id);
      state = state.copyWith(
          hospitalDetail: AsyncValue.data(data!));
    } catch (e, stack) {
      state = state.copyWith(
          hospitalDetail: AsyncValue.error(e, stack));
    }
  }

  Future<void> getDetailHospitalInfoDescData(int id) async {
    try {
      state = state.copyWith(
          detailHospitalInfoDesc: const AsyncValue.loading());
      final data =
      await _repository.getDetailHospitalInfoDescData(id);
      state = state.copyWith(
          detailHospitalInfoDesc: AsyncValue.data(data!));
    } catch (e, stack) {
      state = state.copyWith(
          hospitalDetail: AsyncValue.error(e, stack));
    }
  }
}
