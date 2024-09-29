import 'package:flutter/material.dart';
import 'package:location_shop/component/empty_view.dart';
import 'package:location_shop/model/event_data.dart';
import 'package:location_shop/pages/event_screen/event_detail_screen.dart';
import 'package:location_shop/pages/event_screen/event_list_cell.dart';
import 'package:location_shop/repository/respository.dart';

import '../../common/route_arguments.dart';

class EventListWidget extends StatelessWidget {
  const EventListWidget({super.key, this.id});

  final int? id;

  @override
  Widget build(BuildContext context) {
    final List<EventData> list = id != null
        ? DataRepository.instance.getEventDataListById(id!)
        : DataRepository.instance.getEventAllDatas();

    return Container(
      child: list.isEmpty
          ? const EmptyView()
          : ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return EventListCell(
                  data: list[index],
                  onButtonPressed: (EventData eventData) => {
                    Navigator.pushNamed(context, EventDetailScreen.routeName,
                        arguments: EventArguments(eventData))
                  },
                );
              },
            ),
    );
  }
}
