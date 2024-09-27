import 'package:flutter/material.dart';
import 'package:location_shop/data/event_data.dart';
import 'package:location_shop/pages/event_screen/event_detail_screen.dart';
import 'package:location_shop/pages/event_screen/event_list_cell.dart';
import 'package:location_shop/server/dump_respository.dart';
import 'package:location_shop/server/dump_server.dart';

import '../../common/route_arguments.dart';
import '../../component/top_app_bar_sub.dart';
import 'event_list_widget.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  static const routeName = '/event';

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<EventData> list = DataRepository.getEventDatas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: "EVENT"),
        body:
        EventListWidget()
        // Container(
        //   child:
        //   ListView.builder(
        //     scrollDirection: Axis.vertical,
        //       padding: const EdgeInsets.all(10),
        //       itemCount: list.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return EventListCell(
        //           data: list[index],
        //           onButtonPressed: (EventData eventData) => {
        //             Navigator.pushNamed(
        //                 context,
        //                 EventDetailScreen.routeName,
        //                 arguments: EventArguments(eventData)
        //             )
        //           },
        //
        //         );
        //       })
        // )

    );
  }
}