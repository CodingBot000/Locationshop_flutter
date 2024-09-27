import 'package:flutter/material.dart';
import 'package:location_shop/data/event_data.dart';
import 'package:location_shop/pages/event_screen/event_list_cell.dart';
import 'package:location_shop/server/dump_respository.dart';
import 'package:location_shop/server/dump_server.dart';
import 'package:location_shop/common/constants.dart';

import '../../common/route_arguments.dart';
import '../../component/top_app_bar_sub.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key});

  static const routeName = '/event_detail';

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EventArguments;
    EventData data = args.data;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopAppBarSub(title: "Event For You"),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                data.eventImg,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error,
                    size: 350,
                    color: Colors.red,
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        data.eventName,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    // Right-aligned text
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("${data.eventDateFrom} ~ ${data.eventDateTo}",
                          style: const TextStyle(fontSize: 15)),
                    ),
                    const SizedBox(height: 10.0),
                    // Left-aligned text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.desc,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
