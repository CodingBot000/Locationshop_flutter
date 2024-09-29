import 'package:flutter/material.dart';
import 'package:location_shop/model/event_data.dart';
import 'package:location_shop/repository/respository.dart';

import '../../component/top_app_bar_sub.dart';
import 'event_list_widget.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  static const routeName = '/event';

  @override
  Widget build(BuildContext context) {
    List<EventData> list = DataRepository.instance.getEventAllDatas();
    print('qqq q q q q q q q q ');
    return const Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: "EVENT"),
        body:
        EventListWidget()
    );
  }
}