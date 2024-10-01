import 'package:flutter/material.dart';
import 'package:location_shop/component/empty_view.dart';
import 'package:location_shop/model/event_data.dart';
import 'package:location_shop/pages/event_screen/event_detail_screen.dart';
import 'package:location_shop/pages/event_screen/event_list_cell.dart';

import 'package:location_shop/view_model/event_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/route_arguments.dart';

class EventListWidget extends ConsumerWidget {
  const EventListWidget({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventPageState = ref.watch(eventViewModelProviderFamily(id));

    return Container(
      child: eventPageState.eventDataList.when(
        data: (data) {
          return data.isEmpty
              ? const EmptyView()
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(10),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return EventListCell(
                      data: data[index],
                      onButtonPressed: (EventData eventData) => {
                        Navigator.pushNamed(
                            context, EventDetailScreen.routeName,
                            arguments: EventArguments(eventData))
                      },
                    );
                  },
                );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error HomeGridWidget: $error')),
      ),
    );
  }
}
