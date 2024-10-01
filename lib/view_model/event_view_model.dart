import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_shop/model/event_data.dart';
import 'package:location_shop/repository/repository_event.dart';


class EventScreenPageState {
  final AsyncValue<List<EventData>> eventDataList;

  EventScreenPageState({
    required this.eventDataList,
  });

  factory EventScreenPageState.initial() {
    return EventScreenPageState(
      eventDataList: const AsyncValue.loading(),
    );
  }

  EventScreenPageState copyWith({
    AsyncValue<List<EventData>>? eventDataList,
  }) {
    return EventScreenPageState(
      eventDataList: eventDataList ?? this.eventDataList,
    );
  }
}

final eventViewModelProviderFamily =
  StateNotifierProvider.family<EventViewModel, EventScreenPageState, int?>(
        (ref, id) {
      return EventViewModel(RepositoryEvent(), id);
    });
class EventViewModel extends StateNotifier<EventScreenPageState> {
  final RepositoryEvent _repository;
  final int? _id;

  EventViewModel(this._repository, this._id) : super(EventScreenPageState.initial()) {
    if (_id == null) {
      fetchEventAllDatas();
    } else {
      fetchEventDataListById(_id!);
    }
  }

  Future<void> fetchEventAllDatas() async {
    try {
      state =
          state.copyWith(eventDataList: const AsyncValue.loading());
      final data = await _repository.getEventAllDatas();
      state = state.copyWith(eventDataList: AsyncValue.data(data));
    } catch (e, stack) {
      state =
          state.copyWith(eventDataList: AsyncValue.error(e, stack));
    }
  }

  Future<void> fetchEventDataListById(int id) async {
    try {
      state =
          state.copyWith(eventDataList: const AsyncValue.loading());
      final data = await _repository.getEventDataListById(id);
      state = state.copyWith(eventDataList: AsyncValue.data(data));
    } catch (e, stack) {
      state =
          state.copyWith(eventDataList: AsyncValue.error(e, stack));
    }
  }
}
