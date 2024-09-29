import 'package:flutter/material.dart';
import 'package:location_shop/model/event_data.dart';
import 'package:location_shop/repository/respository.dart';

import '../../component/top_app_bar_sub.dart';
import 'event_list_widget.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  static const routeName = '/event';

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<EventData> list = DataRepository.getEventAllDatas();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: "EVENT"),
        body:
        EventListWidget()
    );
  }
}