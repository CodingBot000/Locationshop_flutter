import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_shop/model/review_data.dart';
import 'package:location_shop/repository/repository_review.dart';

class ReviewScreenPageState {
  final AsyncValue<List<ReviewData>> reviewDataList;

  ReviewScreenPageState({
    required this.reviewDataList,
  });

  factory ReviewScreenPageState.initial() {
    return ReviewScreenPageState(
      reviewDataList: const AsyncValue.loading(),
    );
  }

  ReviewScreenPageState copyWith({
    AsyncValue<List<ReviewData>>? reviewDataList,
  }) {
    return ReviewScreenPageState(
      reviewDataList: reviewDataList ?? this.reviewDataList,
    );
  }
}

final reviewViewModelProviderFamily =
  StateNotifierProvider.family<ReviewViewModel, ReviewScreenPageState, int?>(
        (ref, id) {
      return ReviewViewModel(RepositoryReview(), id);
    });

class ReviewViewModel extends StateNotifier<ReviewScreenPageState> {
  final RepositoryReview _repository;
  final int? _id;

  ReviewViewModel(this._repository, this._id) : super(ReviewScreenPageState.initial()) {
    if (_id == null) {
      fetchReviewAllDataList();
    } else {
      fetchReviewDataListById(_id);
    }
  }

  Future<void> fetchReviewAllDataList() async {
    try {
      state =
          state.copyWith(reviewDataList: const AsyncValue.loading());
      final data = await _repository.getReviewAllDataList();
      state = state.copyWith(reviewDataList: AsyncValue.data(data));
    } catch (e, stack) {
      state =
          state.copyWith(reviewDataList: AsyncValue.error(e, stack));
    }
  }

  Future<void> fetchReviewDataListById(int id) async {
    try {
      state =
          state.copyWith(reviewDataList: const AsyncValue.loading());
      final data = await _repository.getReviewDataListById(id);
      state = state.copyWith(reviewDataList: AsyncValue.data(data));
    } catch (e, stack) {
      state =
          state.copyWith(reviewDataList: AsyncValue.error(e, stack));
    }
  }
}
