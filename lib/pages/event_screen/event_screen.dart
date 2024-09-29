import 'package:flutter/material.dart';

import '../../component/top_app_bar_sub.dart';
import 'event_list_widget.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  static const routeName = '/event';

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