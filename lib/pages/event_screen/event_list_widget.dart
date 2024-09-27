import 'package:flutter/material.dart';
import 'package:location_shop/data/event_data.dart';
import 'package:location_shop/pages/event_screen/event_detail_screen.dart';
import 'package:location_shop/pages/event_screen/event_list_cell.dart';
import 'package:location_shop/server/dump_respository.dart';
import 'package:location_shop/server/dump_server.dart';

import '../../common/route_arguments.dart';
import '../../component/top_app_bar_sub.dart';

class EventListWidget extends StatelessWidget {
  List<EventData> list = DataRepository.getEventDatas();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
            scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return EventListCell(
                  data: list[index],
                  onButtonPressed: (EventData eventData) =>
                  {
                    Navigator.pushNamed(
                        context,
                        EventDetailScreen.routeName,
                        arguments: EventArguments(eventData)
                    )
                  },

                );
              },
          ),
      );
    }

}