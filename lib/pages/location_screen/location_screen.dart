import 'package:flutter/material.dart';
import 'package:location_shop/common/routes.dart';

import '../../component/top_app_bar_sub.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  static const routeName = '/location';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MenuScreenArguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBarSub(title: LocationScreen.routeName),
        body: Text(args.menuTitle)
    );
  }
}