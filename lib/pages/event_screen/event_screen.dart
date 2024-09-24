import 'package:flutter/material.dart';

import '../../common/routes.dart';
import '../../component/top_app_bar_sub.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  static const routeName = '/event';

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: EventScreen.routeName),
        body: Text(EventScreen.routeName)
    );
  }
}